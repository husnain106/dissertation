extends GatesClass

func _ready():
	gateType = "not"
	inputs_available = 1
	max_inputs = 1
	inputs_coordinates = [null, Vector2(0, 38)]
	output_coordinates = Vector2(90,38)
	assign_name()
	global.entities[name] = self
	
	var icon = load("res://Assets/logic_gates/" + User.get_gates_theme().replace('"', "") + "/not_gate.png")
	get_node("Button").set_button_icon(icon)
	
func calculate_values(values):
	var node_inputs = []
	for connection in global.connections:
		if connection.pos2_name == name:
			node_inputs.append(connection.pos1_name)
	if not node_inputs:
		return null
	return not global.entities[node_inputs[0]].calculate_values(values)
