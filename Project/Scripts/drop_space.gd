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

