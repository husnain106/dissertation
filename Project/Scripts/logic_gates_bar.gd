extends Control

var mynode = preload("res://Sprites/not_gate.tscn")
var pos = Vector2(666/2, 374/2)

func _on_not_gate_button_pressed():
	var instance = mynode.instantiate()
	instance.position = pos
	if get_parent():
		get_parent().add_child(instance)
	else:
		add_child(instance)
	
	#add_child(instance)
