extends Node

#the initial incomplete circuit that the user will need to complete
var entities = {}   #a dictionary where key is the name, element is an array where index 0 is type and index 1 is vector for position
var connections = [] #a list of dictionaries where each dictionary is a connection and the dictionaries contain the two connecting entities
var used_inputs = [] #the inputs names already used
var input_names_available = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

#the truth table to compare if the user has finished the level
var input_variations = []
var truth_table_values = []

#changes depending on what can the user do or not in this level:
#true -> can be used
#false -> cannot be used in this level
#integer value -> The number of times this button can be used 
var buttons_enabled = {
	"not" : false,
	"and" : false,
	"or" : false,
	"add_inputs" : false,
	"linking" : true,
	"delete" : false
}

#This will check if the user has completed the level or not
func _process(delta):
	pass

#add and delete logic gates or inputs
func add_entities(type, pos, name):
	entities[name] = [type, pos]

func delete_entities():
	entities.erase(name)

#add or delete connections
func add_connections(name1, name2):
	connections.append({"pos1": name1, "pos2":name2})

func delete_connections(name1, name2):
	pass

#calculate the input variations for truth tables and the values
func calculate_truth_table():
	pass
