extends GatesClass

func _ready():
	gateType = "not"
	inputs_available = 1
	inputs_coordinates = [null, Vector2(0, 38)]
	output_coordinates = Vector2(90,38)
	assign_name()
	global.entities[name] = self
	print(global.entities)
