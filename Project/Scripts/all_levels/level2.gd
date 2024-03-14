extends "res://Scripts/all_levels/LevelClass.gd"


# Called when the node enters the scene tree for the first time.
func _init():
	reward = 20
	
	initial_entities = {
		"not0": ["not", random_position("not")],
	}
	initial_connections = []
	
	intended_solution_entities = {
		"not0": "not",
		"A": "input"
	}
	intended_solution_connections = [{"pos1": "A", "pos2": "not0"}]
	
	input_variations = [{"A" : false}, {"A": true}]
	truth_table_values = [{"not0": true}, {"not0": false}]
	
	message = "To add an input to the system,
	click the new input button at the bottom"
	
	#Can only connect already available entities in this level
	buttons_enabled = {
	"not_gate_button" : false,
	"and_gate_button" : false,
	"or_gate_button" : false,
	"new_input_button" : true,
	"link_button" : true,
	"delete_button" : false
}
