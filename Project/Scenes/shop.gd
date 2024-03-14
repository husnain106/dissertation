extends Control

var current_theme = User.gates_theme

var price_themes ={"first_draft": 0,
"blue": 200,
"green": 200,
"red": 500}

var initial = false

# Called when the node enters the scene tree for the first time.
func _ready():
	
	for theme in User.owned_themes:
		if User.owned_themes[theme]:
			#var icon = "res://Assets/logic_gates/" + theme + "/or_gate.png"
			get_node("VBoxContainer/GridContainer/" + theme).set_texture_normal(load("res://Assets/logic_gates/" + theme + "/or_gate.png"))
		else:
			get_node("VBoxContainer/GridContainer/" + theme).set_texture_normal(load("res://Assets/logic_gates/" + theme + "/buy_theme.png"))
	get_node("VBoxContainer/GridContainer/" + User.gates_theme.replace('"', "")).pressed.emit()
	update_display()

func update_display():
	get_node("VBoxContainer/display_grid/not").set_button_icon(load("res://Assets/logic_gates/" + User.gates_theme + "/not_gate.png"))
	get_node("VBoxContainer/display_grid/or").set_button_icon(load("res://Assets/logic_gates/" + User.gates_theme + "/or_gate.png"))
	get_node("VBoxContainer/display_grid/and").set_button_icon(load("res://Assets/logic_gates/" + User.gates_theme + "/and_gate.png"))
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for theme in User.owned_themes:
		if User.owned_themes[theme]:
			#var icon = "res://Assets/logic_gates/" + theme + "/or_gate.png"
			get_node("VBoxContainer/GridContainer/" + theme).set_texture_normal(load("res://Assets/logic_gates/" + theme + "/or_gate.png"))
		else:
			get_node("VBoxContainer/GridContainer/" + theme).set_texture_normal(load("res://Assets/logic_gates/" + theme + "/buy_theme.png"))
		
func _on_first_draft_pressed():
	var temp_path = ("VBoxContainer/GridContainer/" + str(current_theme))
	User.gates_theme = "first_draft"
	update_display()

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
	update_display()
