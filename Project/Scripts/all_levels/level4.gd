extends "res://Scripts/all_levels/LevelClass.gd"


# Called when the node enters the scene tree for the first time.
func _init():
	initial_entities = {
		"not0": ["not", random_position("not")],
		"A": ["input", random_position("input")]
	}
	initial_connections = [{"pos1": "A", "pos2": "not0"}]
	
	intended_solution_entities = { 
		"not0": "not",
		"not1": "not",
		"A": "input"
	}
	intended_solution_connections = [{"pos1": "A", "pos2": "not0"}, {"pos1": "not0", "pos2": "not1"}]
	
	input_variations = [{"A" : false}, {"A": true}]
	truth_table_values = [{"not1": false}, {"not1": true}]
	
	message = "A not gate passed into another not gate
	will return the same value because a double
	not gate cancels out.
	To crete another not gate, click on the not gate
	icon at the bottom"
	
	#Can only connect already available entities in this level
	buttons_enabled = {
	"not_gate_button" : true,
	"and_gate_button" : false,
	"or_gate_button" : false,
	"new_input_button" : false,
	"link_button" : true,
	"delete_button" : false
}
