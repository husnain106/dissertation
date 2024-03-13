extends Control

var current_theme = User.gates_theme

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_node("VBoxContainer/display_grid/not").set_button_icon(load("res://Assets/logic_gates/" + User.gates_theme + "/not_gate.png"))
	get_node("VBoxContainer/display_grid/or").set_button_icon(load("res://Assets/logic_gates/" + User.gates_theme + "/or_gate.png"))
	get_node("VBoxContainer/display_grid/and").set_button_icon(load("res://Assets/logic_gates/" + User.gates_theme + "/and_gate.png"))


func _on_first_draft_pressed():
	var temp_path = ("VBoxContainer/GridContainer/" + str(current_theme))
	User.gates_theme = "first_draft"

func _on_green_pressed():
	var temp_path = ("VBoxContainer/GridContainer/" + str(current_theme))
	User.gates_theme = "green"

func _on_blue_pressed():
	var temp_path = ("VBoxContainer/GridContainer/" + str(current_theme))
	User.gates_theme = "blue"

func _on_red_pressed():
	var temp_path = ("VBoxContainer/GridContainer/" + str(current_theme))
	User.gates_theme = "red"
