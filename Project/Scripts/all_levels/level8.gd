extends "res://Scripts/all_levels/LevelClass.gd"


# Called when the node enters the scene tree for the first time.
func _init():
	
	reward = 150
	
	#global.inputs_used = ["A", "B"]
	initial_entities = {
		"or0": ["or", random_position("or")],
		"A": ["input", random_position("input")],
		"B": ["input", random_position("input")]
	}
	initial_connections = []
	
	intended_solution_entities = { 
		"or0": "or",
		"A": "input",
		"B": "input",
		"not0": "not"
	}
	intended_solution_connections = [{"pos1": "A", "pos2": "not0"},{"pos1": "not0", "pos2": "or0"} ,{"pos1": "B", "pos2": "or0"}]
	
	input_variations = [{"A" : false, "B": false}, 
	{"A": true, "B": false},
	{"A": false, "B": true},
	{"A": true, "B": true}]
	
	truth_table_values = [{"or0": true},
	{"or0": false},
	{"or0": true},
	{"or0": true}
	]
	
	message = "You can also use a NOT gate on one of the inputs before 
	passing it into an OR gate, however you need to be careful
	about which input is passed through a NOT gate and which 
	input isn't since it is not necessarily interchangable. 
	Look at the truth table beforehand and try to figure this out"
	
	#Can only connect already available entities in this level
	buttons_enabled = {
	"not_gate_button" : true,
	"and_gate_button" : false,
	"or_gate_button" : false,
	"new_input_button" : false,
	"link_button" : true,
	"delete_button" : false
}
