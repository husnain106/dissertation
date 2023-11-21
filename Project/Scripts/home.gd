extends Control

func _on_menu_button_pressed():
	if get_node("menu").visible == false:
		get_node("menu").show()
	else:
		get_node("menu").hide()
