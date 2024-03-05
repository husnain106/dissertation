extends "res://Scripts/all_levels/LevelClass.gd"


# Called when the node enters the scene tree for the first time.
func _init():
	initial_entities = {
		"or0": ["or", random_position("or")],
		"A": ["input", random_position("input")],
		"B": ["input", random_position("input")]
	}
	initial_connections = []
	
	intended_solution_entities = { 
		"or0": "or",
		"A": "input",
		"B": "input"
	}
	intended_solution_connections = [{"pos1": "A", "pos2": "or0"}, {"pos1": "B", "pos2": "or0"}]
	
	input_variations = [{"A" : false, "B": false}, 
	{"A": true, "B": false},
	{"A": false, "B": true},
	{"A": true, "B": true}]
	
	truth_table_values = [{"or0": false},
	{"or0": true},
	{"or0": true},
	{"or0": true}
	]
	
	message = "An OR gate takes in 2 inputs
	instead of 1 and it returns the output
	if either of those inputs are true
	and return false only when they are
	both false"
	
	#Can only connect already available entities in this level
	buttons_enabled = {
	"not_gate_button" : false,
	"and_gate_button" : false,
	"or_gate_button" : false,
	"new_input_button" : false,
	"link_button" : true,
	"delete_button" : false
}
