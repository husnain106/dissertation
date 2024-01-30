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

