extends "res://Scripts/all_levels/LevelClass.gd"


# Called when the node enters the scene tree for the first time.
func _init():
	initial_entities = {
		"not0": ["not", random_position()],
		"A": ["input", random_position()]
	}
	initial_connections = []
	
	intended_solution_entities = {
		"not0": ["not", random_position()],
		"A": ["input", random_position()]
	}
	intended_solution_connections = [{"pos1": "A", "pos2": "B"}]
	
	input_variations = [{"A" : false}, {"A": true}]
	truth_table_values = [{"not0": true}, {"not0": false}]
	
	
	#Can only connect already available entities in this level
	var buttons_enabled = {
	"not" : false,
	"and" : false,
	"or" : false,
	"add_inputs" : false,
	"linking" : true,
	"delete" : false
}
