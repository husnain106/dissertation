extends Control



func _on_play_levels_pressed():
	get_tree().change_scene_to_file("res://Scenes/levels.tscn")


func _on_play_online_pressed():
	get_tree().change_scene_to_file("res://Scenes/online.tscn")


func _on_free_space_pressed():
	get_tree().change_scene_to_file("res://Scenes/free_space.tscn")


func _on_shop_pressed():
	get_tree().change_scene_to_file("res://Scenes/shop.tscn")


func _on_learn_pressed():
	get_tree().change_scene_to_file("res://Scenes/learn.tscn")


func _on_settings_pressed():
	get_tree().change_scene_to_file("res://Scenes/settings.tscn")


func _on_home_pressed():
	get_tree().change_scene_to_file("res://Scenes/home.tscn")
