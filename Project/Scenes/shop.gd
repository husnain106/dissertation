extends Control


var price_themes ={"first_draft": 0,
"blue": 200,
"green": 200,
"red": 500}

var initial = false

# Called when the node enters the scene tree for the first time.
func _ready():
	#get_node("VBoxContainer/GridContainer/" + User.get_gates_theme().replace('"', "")).pressed.emit()
	for theme in User.get_all_owned_themes():
		if User.get_owned_themes(theme):
			#var icon = "res://Assets/logic_gates/" + theme + "/or_gate.png"
			get_node("VBoxContainer/GridContainer/" + theme).set_texture_normal(load("res://Assets/logic_gates/" + theme + "/or_gate.png"))
		else:
			get_node("VBoxContainer/GridContainer/" + theme).set_texture_normal(load("res://Assets/logic_gates/" + theme + "/buy_theme.png"))
	update_display()

func update_display():
	get_node("VBoxContainer/display_grid/not").set_button_icon(load("res://Assets/logic_gates/" + User.get_gates_theme().replace('"', "") + "/not_gate.png"))
	get_node("VBoxContainer/display_grid/or").set_button_icon(load("res://Assets/logic_gates/" + User.get_gates_theme().replace('"', "") + "/or_gate.png"))
	get_node("VBoxContainer/display_grid/and").set_button_icon(load("res://Assets/logic_gates/" + User.get_gates_theme().replace('"', "") + "/and_gate.png"))
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for theme in User.get_all_owned_themes():
		if User.get_owned_themes(theme):
			#var icon = "res://Assets/logic_gates/" + theme + "/or_gate.png"
			get_node("VBoxContainer/GridContainer/" + theme).set_texture_normal(load("res://Assets/logic_gates/" + theme + "/or_gate.png"))
		else:
			get_node("VBoxContainer/GridContainer/" + theme).set_texture_normal(load("res://Assets/logic_gates/" + theme + "/buy_theme.png"))
		
func _on_first_draft_pressed():
	User.set_gates_theme("first_draft")
	update_display()

func _on_green_pressed():
	process_button_pressed("green")

func _on_blue_pressed():
	process_button_pressed("blue")

func _on_red_pressed():
	process_button_pressed("red")

func process_button_pressed(theme):
	if User.get_owned_themes(theme):
		User.set_gates_theme(theme)
	elif not User.get_owned_themes(theme) and User.get_gold() >= price_themes[theme]:
		User.set_gold(User.get_gold() - price_themes[theme])
		User.bought_theme(theme)
		User.set_gates_theme(theme)
	else:
		print("Not enough money to buy this " + theme)
	update_display()
