extends Control

func _ready():
	var user_res = "res://user_data.txt"
	var file = FileAccess.open(user_res, FileAccess.READ)
	var content = process_file(file.get_as_text())
	
	get_node("margin_main/vertical_container/margin_account_row/account_row/margin_name/username").text = str(User.get_username())
	get_node("margin_main/vertical_container/margin_account_row/account_row/margin_gold_amount/gold_amount").text = str(User.get_gold())
	
	if global.change_scene_to !=  null:
		var temp = global.change_scene_to
		global.change_scene_to = null
		get_tree().change_scene_to_file(temp)

func _on_menu_button_pressed():
	if get_node("menu").visible == false:
		get_node("menu").show()
	else:
		get_node("menu").hide()
			
func process_file(content):
	content = content.split("\n")
	User.set_username(content[0])
	content.remove_at(0)
	
	User.set_gold(int(content[0]))
	content.remove_at(0)
	
	User.set_level(int(content[0]))
	content.remove_at(0)
	
	User.set_gates_theme(content[0])
	content.remove_at(0)
	
	for x in range (0, len(content)):
		if content[x] != "":
			var temp = content[x].replace('"', "")
			#temp = temp.replace()
			User.bought_theme(temp)
