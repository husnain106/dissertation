extends "res://Scripts/all_levels/LevelClass.gd"


# Called when the node enters the scene tree for the first time.
func _init():
	initial_entities = {
		"not0": ["not", random_position("not")],
		"A": ["input", random_position("input")]
	}
	initial_connections = []
	
	intended_solution_entities = {
		"not0": "not",
		"A": "input"
	}
	intended_solution_connections = [{"pos1": "A", "pos2": "not0"}]
	
	input_variations = [{"A" : false}, {"A": true}]
	truth_table_values = [{"not0": true}, {"not0": false}]
	
	message = "A NOT gate takes a value and returns the opposite of it. 
For example if you connect the input A to the not gate 
using the link button at the bottom and then click 
on the truth table and you will see how this gate 
returns the opposite of its input"
	
	#Can only connect already available entities in this level
	buttons_enabled = {
	"not_gate_button" : false,
	"and_gate_button" : false,
	"or_gate_button" : false,
	"new_input_button" : false,
	"link_button" : true,
	"delete_button" : false
}
