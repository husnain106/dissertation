extends GatesClass

func _ready():
	gateType = "and"
	inputs_available = 2
	inputs_coordinates = [Vector2(0, 26), Vector2(0, 51)]
	output_coordinates = Vector2(90,38)
	assign_name()
	global.entities[name] = self
	print(global.entities)

