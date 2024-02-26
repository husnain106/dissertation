extends Node2D

var linking = false

var input = null
var input_name = null

var output = null
var output_name = null

var all_input_names = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

var number_inputs = 0
var entities = {}
var counts = {
	"and" : 0,
	"or" : 0,
	"not" : 0}

var connections = []

var all_values = []

func all_true(binary):
	for x in binary:
		if x == false:
			return false
	return true
	

func increment(binary):
	var i = len(binary)
	while i >= 0 :
		if binary[i] == false:
			binary[i] == true
			for x in range (i+1, len(binary)):
				binary[x] = false
			return binary
	return false

func set_inputs_values(temp, binary):
	for x in range (0, len(binary)):
		temp[all_input_names[x]] = binary[x]
	return temp
	#for x in temp:
		
	

func truth_table(output):
	var binary = []
	for x in range (0, number_inputs):
		binary.append(false)
	
	while not all_true(binary):
		all_values = entities
		all_values = set_inputs_values(all_values, binary)
		
		
