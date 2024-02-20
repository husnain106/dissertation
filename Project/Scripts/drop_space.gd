extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	global.linking = false

	global.input = null
	global.input_name = null

	global.output = null
	global.output_name = null

	global.entities = {}
	global.counts = {
		"and" : 0,
		"or" : 0,
		"not" : 0}

	global.connections = []
	global.number_inputs = 0


func _on_area_2d_mouse_entered():
	get_child(2).scale = Vector2(0.02*1.05, 0.02*1.05)

func _on_area_2d_mouse_exited():
	get_child(2).scale = Vector2(0.02,0.02)

func _on_truth_table_button_pressed():
	if get_node("truth_table").visible == false:
		get_node("truth_table").show()
	else:
		get_node("truth_table").hide()
	
	var temp = get_node("ColorRect").get_color()
	get_node("ColorRect").set_color(get_node("truth_table").get_node("ColorRect").get_color())
	get_node("truth_table").get_node("ColorRect").set_color(temp)
