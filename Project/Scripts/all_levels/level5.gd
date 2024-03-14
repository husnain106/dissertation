extends "res://Scripts/all_levels/LevelClass.gd"


# Called when the node enters the scene tree for the first time.
func _init():
	reward = 50
	
	initial_entities = {
		"not0": ["not", Vector2(300, 150)],
		"A": ["input", random_position("input")],
		"not1": ["not", Vector2(500, 200)],
		"B": ["input", random_position("input")],
		"not2": ["not", Vector2(500,140)]
	}
	initial_connections = [{"pos1": "A", "pos2": "not0"}, {"pos1": "not0", "pos2": "not1"}]
	
	intended_solution_entities = { 
		"not0": "not",
		"not1": "not",
		"A": "input"
	}
	intended_solution_connections = [{"pos1": "A", "pos2": "not0"}, {"pos1": "not0", "pos2": "not1"}]
	
	input_variations = [{"A" : false}, {"A": true}]
	truth_table_values = [{"not1": false}, {"not1": true}]
	
	message = "To delete an input or a logic gate,
	click on the delete buttom an the bottom and
	then click on waht you need to delete.
	In this level, delete the input B and
	not gate called not2"
	
	#Can only connect already available entities in this level
	buttons_enabled = {
	"not_gate_button" : false,
	"and_gate_button" : false,
	"or_gate_button" : false,
	"new_input_button" : false,
	"link_button" : false,
	"delete_button" : true
}
