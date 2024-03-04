extends Node

#the initial incomplete circuit that the user will need to complete
var initial_entities = {}   #a dictionary where key is the name, element is an array where index 0 is type and index 1 is vector for position
var initial_connections = [] #a list of dictionaries where each dictionary is a connection and the dictionaries contain the two connecting entities


#the intended solution, same format as the initial
var intended_solution_entities = {}
var intended_solution_connections = []


#the truth table to compare if the user has finished the level
var input_variations = [] #a list of dictionaries
var truth_table_values = [] #a list of dictionaries

#changes depending on what can the user do or not in this level:
#true -> can be used
#false -> cannot be used in this level
#integer value -> The number of times this button can be used 
var buttons_enabled = {
	"not_gate_button" : false,
	"and_gate_button" : false,
	"or_gate_button" : false,
	"new_input_button" : false,
	"link_button" : true,
	"delete_button" : false
}

var message = null

#This will check if the user has completed the level or not
func _process(delta):
	pass

#add and delete logic gates or inputs
func add_entities(type, pos, name):
	initial_entities[name] = [type, pos]

func delete_entities():
	initial_entities.erase(name)

#add or delete connections
func add_connections(name1, name2):
	initial_connections.append({"pos1": name1, "pos2":name2})

func delete_connections(name1, name2):
	pass

#calculate the input variations for truth tables and the values
func calculate_truth_table():
	pass

func random_position(type):
	var x
	var y
	if type == "input":
		x = randi_range(100,200)
		y = randi_range(100, 200)
	else:
		x = randi_range(250,500)
		y = randi_range(100, 200)
	
	return Vector2(x,y)
