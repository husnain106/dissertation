extends GatesClass

func _ready():
	gateType = "or"
	inputs_available = 2
	inputs_coordinates = [Vector2(0, 30), Vector2(0, 46)]
	output_coordinates = Vector2(90,39)
	
	assign_name()
	global.entities[name] = self
	print(global.entities)
