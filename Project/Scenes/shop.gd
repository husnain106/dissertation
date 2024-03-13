extends Control

var current_theme = User.gates_theme

var price_themes ={"first_draft": 0,
"blue": 200,
"green": 200,
"red": 500}

var initial = false

# Called when the node enters the scene tree for the first time.
func _ready():
	var user_res = "res://user_data.txt"
	var file = FileAccess.open(user_res, FileAccess.READ)
	var content = process_file(file.get_as_text())
	
	for theme in User.owned_themes:
		if User.owned_themes[theme]:
			#var icon = "res://Assets/logic_gates/" + theme + "/or_gate.png"
			get_node("VBoxContainer/GridContainer/" + theme).set_texture_normal(load("res://Assets/logic_gates/" + theme + "/or_gate.png"))
		else:
			get_node("VBoxContainer/GridContainer/" + theme).set_texture_normal(load("res://Assets/logic_gates/" + theme + "/buy_theme.png"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	get_node("VBoxContainer/display_grid/not").set_button_icon(load("res://Assets/logic_gates/" + User.gates_theme + "/not_gate.png"))
	get_node("VBoxContainer/display_grid/or").set_button_icon(load("res://Assets/logic_gates/" + User.gates_theme + "/or_gate.png"))
	get_node("VBoxContainer/display_grid/and").set_button_icon(load("res://Assets/logic_gates/" + User.gates_theme + "/and_gate.png"))
	
	for theme in User.owned_themes:
		if User.owned_themes[theme]:
			#var icon = "res://Assets/logic_gates/" + theme + "/or_gate.png"
			get_node("VBoxContainer/GridContainer/" + theme).set_texture_normal(load("res://Assets/logic_gates/" + theme + "/or_gate.png"))
		else:
			get_node("VBoxContainer/GridContainer/" + theme).set_texture_normal(load("res://Assets/logic_gates/" + theme + "/buy_theme.png"))

func process_file(content):
	content = content.split("\n")
	User.name = content[0]
	content.remove_at(0)
	
	User.gold = content[0]
	content.remove_at(0)
	
	User.level = content[0]
	content.remove_at(0)
	
	User.gates_theme = content[0]
	content.remove_at(0)
	
	for x in range (0, len(content)):
		if content[x] != "":
			var temp = content[x].replace('"', "")
			#temp = temp.replace()
			User.owned_themes.erase(temp)
			User.owned_themes[temp] = true
		
func _on_first_draft_pressed():
	var temp_path = ("VBoxContainer/GridContainer/" + str(current_theme))
	User.gates_theme = "first_draft"

func _on_green_pressed():
	process_button_pressed("green")

func _on_blue_pressed():
	process_button_pressed("blue")

func _on_red_pressed():
	process_button_pressed("red")

func process_button_pressed(theme):
	if User.owned_themes[theme]:
		var temp_path = ("VBoxContainer/GridContainer/" + str(current_theme))
		User.gates_theme = theme
	elif not User.owned_themes[theme] and User.gold >= price_themes[theme]:
		User.gold -= price_themes[theme]
		User.owned_themes[theme] = true
		var temp_path = ("VBoxContainer/GridContainer/" + str(current_theme))
		User.gates_theme = theme
	else:
		print("Not enough money to buy this " + theme)
