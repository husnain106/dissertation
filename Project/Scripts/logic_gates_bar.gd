extends Control

var pos = Vector2(666/2, 374/2)
var pos2 = Vector2(0,0)
var node

var input_names_available = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

func _on_and_gate_button_pressed():
	node = load("res://Sprites/and_gate.tscn")
	var instance = node.instantiate()
	instance_of(instance)


func _on_or_gate_button_pressed():
	node = load("res://Sprites/or_gate.tscn")
	var instance = node.instantiate()
	instance_of(instance)

func _on_not_gate_button_pressed():
	node = load("res://Sprites/not_gate.tscn")
	var instance = node.instantiate()
	instance_of(instance)

func _on_new_input_button_pressed():
	node = load("res://Sprites/inputs.tscn")
	var instance = node.instantiate()
	if input_names_available.size()>1:
		instance.get_child(0).get_child(0).text = input_names_available.pop_at(0)
	instance_of(instance)

func instance_of(instance):
	if get_parent():
		instance.position = pos
		get_parent().add_child(instance)
	else:
		instance.posiiton = pos2
		add_child(instance)

func _on_link_button_pressed():
	if not global.linking:
		global.linking = true
		global.input = null
		global.output = null
		scale = Vector2(1.05, 1.05)
	else:
		global.linking = false
		global.input = null
		global.output = null
		scale = Vector2(1,1)
	
func _process(delta):
	if global.linking and global.input != null and global.output != null:
		var pos1 = global.input
		#print(pos1)
		var pos2 = global.output
		#print(pos2)
		#var pos1 = Vector2(50,200)
		#var pos2 = Vector2(200,100)
		print(pos1)
		print(pos2)
		node = load("res://Sprites/line.tscn")
		var instance = node.instantiate()
		#instance.position = pos1
		var array = PackedVector2Array([pos1, Vector2((pos1[0] + pos2[0])/2, pos1[1]), Vector2((pos1[0] + pos2[0])/2, pos2[1]), Vector2(pos2[0], pos2[1])])
		
		
		instance.set_points(array)
		print(instance.position)
		print(instance.get_points())
		
		get_parent().add_child(instance)
		global.linking = false
		global.input = null
		global.output = null
		
