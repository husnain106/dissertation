extends Control

var curr_level
var completed = false

func _ready():
	#get_node("VBoxContainer/logic_gates_bar").clear()
	print(global.entities)
	global.current_mode = "levels"
	var path = "res://Scripts/all_levels/level" + str(global.level_number)+ ".gd"
	var load_level = load(path)
	completed = false
	curr_level = load_level.new()
	
	load_entities(curr_level.initial_entities)
	#add_connections(curr_level.initial_connections)

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
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
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
		
