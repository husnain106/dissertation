extends GatesClass

func _ready():
	gateType = "input"
	inputs_available = 0
	max_inputs = 0
	inputs_coordinates = [null, null]
	output_coordinates = Vector2(-4,15)
	global.entities[name] = self


func calculate_values(values):
	return values[name]
