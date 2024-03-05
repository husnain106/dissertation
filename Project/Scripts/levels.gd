extends Control

var curr_level
var completed = false
var time

func _ready():
	#get_node("VBoxContainer/logic_gates_bar").clear()
	print(global.entities)
	global.current_mode = "levels"
	
	var path = "res://Scripts/all_levels/level" + str(global.level_number)+ ".gd"
	var load_level = load(path)
	completed = false
	curr_level = load_level.new()
	
	show_message(curr_level)
	enabled_buttons(curr_level.buttons_enabled)
	load_entities(curr_level.initial_entities)
	add_connections(curr_level.initial_connections)


func enabled_buttons(buttons):
	for x in buttons:
		var button_node = "VBoxContainer/logic_gates_bar/" + str(x)
		if not buttons[x]:
			get_node(button_node).disabled = true
		else:
			get_node(button_node).disabled = false


func show_message(level):
	if level.message == null:
		get_node("VBoxContainer/drop_space/level_hint").hide()
	else:
		get_node("VBoxContainer/drop_space/level_hint").text = str(level.message)

func load_entities(entities):
	for x in entities:
		if entities[x][0] == "not":
			get_node("VBoxContainer/logic_gates_bar/not_gate_button").pressed.emit()
		elif entities[x][0] == "and":
			get_node("VBoxContainer/logic_gates_bar/and_gate_button").pressed.emit()
		elif entities[x][0] == "or":
			get_node("VBoxContainer/logic_gates_bar/or_gate_button").pressed.emit()
		elif entities[x][0] == "input":
			get_node("VBoxContainer/logic_gates_bar/new_input_button").pressed.emit()
		else:
			print("Wrong gateType when making the level")
		global.entities[x].move_to(entities[x][1])

func add_connections(connections):
	for x in connections:
		get_node("VBoxContainer/logic_gates_bar/link_button").pressed.emit()
		var pos1 = "VBoxContainer/" + str(x["pos1"]) + "/Button"
		get_node(pos1).pressed.emit()
		var pos2 = "VBoxContainer/" + str(x["pos2"]) + "/Button"
		get_node(pos2).pressed.emit()
		get_node("VBoxContainer/logic_gates_bar")._process(time)
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time = delta
	var output = get_node("VBoxContainer/drop_space/truth_table").get_truth_table_values()
	if not completed and output == curr_level.truth_table_values:
		completed = true
		global.correct_truth_table = curr_level.truth_table_values
		get_node("VBoxContainer/drop_space/truth_table_button").pressed.emit() #show the completed truh table to the user
		await get_node("VBoxContainer/drop_space/truth_table_button").pressed #wait until the user closes the truth table to change to next level
		
		
		#change to the nect scene
		global.level_number += 1
		global.change_scene_to = "res://Scenes/levels.tscn"
		get_tree().change_scene_to_file("res://Scenes/home.tscn")
	else:
		global.correct_truth_table = curr_level.truth_table_values
		


func _on_timer_timeout():
	print("timer done")


func _on_hint_button_pressed():
	if get_node("VBoxContainer/drop_space/level_hint").visible:
		get_node("VBoxContainer/drop_space/level_hint").hide()
	else:
		get_node("VBoxContainer/drop_space/level_hint").show()


func _on_area_2d_mouse_entered():
	get_node("VBoxContainer/drop_space/hint_button").scale = Vector2(0.055*1.05, 0.055*1.05)

func _on_area_2d_mouse_exited():
	get_node("VBoxContainer/drop_space/hint_button").scale = Vector2(0.055, 0.055)
