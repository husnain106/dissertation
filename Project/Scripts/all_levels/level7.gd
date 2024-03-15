extends "res://Scripts/all_levels/LevelClass.gd"


# Called when the node enters the scene tree for the first time.
func _init():
	
	reward = 120
	
	#global.inputs_used = ["A", "B"]
	initial_entities = {
		"or0": ["or", random_position("or")],
		"A": ["input", random_position("input")],
		"B": ["input", random_position("input")],
		"C": ["input", random_position("input")]
	}
	initial_connections = []
	
	intended_solution_entities = { 
		"or0": "or",
		"A": "input",
		"B": "input",
		"C": "input",
		"or1": "or"
	}
	intended_solution_connections = [{"pos1": "A", "pos2": "or0"}, 
	{"pos1": "B", "pos2": "or0"},
	{"pos1": "or0", "pos2": "or1"},
	{"pos1": "C", "pos2": "or1"}]
	
	input_variations = [{"A" : false, "B": false, "C": false}, 
	{"A": true, "B": false, "C": false},
	{"A": false, "B": true, "C": false},
	{"A": true, "B": true, "C": false},
	{"A" : false, "B": false, "C": true}, 
	{"A": true, "B": false, "C": true},
	{"A": false, "B": true, "C": true},
	{"A": true, "B": true, "C": true}]
	
	truth_table_values = [{"or1": false},
	{"or1": true},
	{"or1": true},
	{"or1": true},
	{"or1": true},
	{"or1": true},
	{"or1": true},
	{"or1": true}
	]
	
	message = "To pass three inputs into an or gate, you can pass 
	two inputs in an or gate, then pass the output of the first 
	or gate and the third input into a second or gate.
	
	In this level, connect two inputs to or0, then make another 
	or gate which will be or1. Pass the output of or0 and the 
	final input into or1.
	"
	
	#Can only connect already available entities in this level
	buttons_enabled = {
	"not_gate_button" : false,
	"and_gate_button" : false,
	"or_gate_button" : true,
	"new_input_button" : false,
	"link_button" : true,
	"delete_button" : false
}
