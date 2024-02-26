extends GatesClass

func _ready():
	gateType = "or"
	inputs_available = 2
	max_inputs = 2
	inputs_coordinates = [Vector2(0, 30), Vector2(0, 46)]
	output_coordinates = Vector2(90,39)
	
	assign_name()
	global.entities[name] = self


func calculate_values(values):
	var node_inputs = []
	for connection in global.connections:
		if connection.pos2_name == name:
			node_inputs.append(connection.pos1_name)
	if len(node_inputs)<2:
		return null
	return global.entities[node_inputs[0]].calculate_values(values) or global.entities[node_inputs[1]].calculate_values(values)
