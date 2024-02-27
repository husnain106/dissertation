extends Control

func _ready():
	if global.change_scene_to !=  null:
		var temp = global.change_scene_to
		global.change_scene_to = null
		get_tree().change_scene_to_file(temp)

func _on_menu_button_pressed():
	if get_node("menu").visible == false:
		get_node("menu").show()
	else:
		get_node("menu").hide()
			
