extends Control


func _on_texture_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/home.tscn")

func _process(delta):
	get_node("margin_header_row/header_row/margin_gold_amount/gold_amount").text = str(User.gold)
	get_node("margin_header_row/header_row/username").text = str(User.username)
