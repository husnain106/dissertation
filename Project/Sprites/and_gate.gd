extends GatesClass

func _ready():
	gateType = "and"
	inputs_available = 2
	max_inputs = 2
	inputs_coordinates = [Vector2(0, 26), Vector2(0, 51)]
	output_coordinates = Vector2(90,38)
	assign_name()
	global.entities[name] = self
	
	#set the right theme of the logic gate
	var icon = load("res://Assets/logic_gates/" + User.gates_theme.replace('"', "")+ "/and_gate.png")
	get_node("Button").set_button_icon(icon)

func calculate_values(values):
	var node_inputs = []
	for connection in global.connections:
		if connection.pos2_name == name:
			node_inputs.append(connection.pos1_name)
	if len(node_inputs)<2:
		return null
	return global.entities[node_inputs[0]].calculate_values(values) and global.entities[node_inputs[1]].calculate_values(values)
