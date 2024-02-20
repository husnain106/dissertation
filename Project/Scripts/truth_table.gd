extends Control

var output_nodes
var input_nodes
var output_values =[]
var all_input_variations = []
#var input_values = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_visibility_changed():
	if visible:
		output_nodes = all_output_nodes()
		#dictionary, where key is the name of the nodes, and the element is the node itself
		
		input_nodes = all_input_values()
		#dictionary, where key is the name of the nodes, and the element is the node itself
		
		all_input_variations = input_variations()
		#a list of dictionaires which represent each variation
		
		for variation in all_input_variations:
			#variation is a dictinary
			var temp = {}
			for output in output_nodes:
				temp[output] = output_nodes[output].calculate_values(variation)  #calculate values of each output node recursively
			output_values.append(temp) #a list of dictionaries
		
		
		print("input values are       ", all_input_variations)
		print("output values are      ", output_values)
		
		
		for x in range (len(output_values)):
			var label = Label.new()
			var label2 = Label.new()
			label.modulate = Color(0,0,0)
			label2.modulate = Color(0,0,0)
		
			var a = label
			a.text = dictionary_to_string(all_input_variations[x])
			get_node("ScrollContainer/GridContainer").add_child(a)
			var b = label2
			b.text = dictionary_to_string(output_values[x])
			b.position = Vector2(10,10)
			get_node("ScrollContainer/GridContainer").add_child(b)
		
		
		
func dictionary_to_string(dict):
	var output = ""
	for x in dict:
		output = output + str(x) +" is " +str(dict[x]) + "\n"
	return output

func _on_hidden():
	for n in get_node("ScrollContainer/GridContainer").get_children():
		n.queue_free()






func all_outputs():
	for inputs in all_input_variations:
		for node in output_nodes:
			output_values.append(dfs(node, inputs))

func dfs(node, values):
	return node.calculate_values(values)


func int_to_bin(num, bits):
	var count = 0
	var output = {}
	for x in range(bits, 0, -1):
		if num >= 2**(x-1):
			output[global.all_input_names[count]] = true
			num -= 2**(x-1)
		else:
			output[global.all_input_names[count]] = false
		count += 1
	return output

func input_variations():
	var variations = []  #a list of dicitonaries which will be the binary
	var num_inputs = len(input_nodes) #this will represent the number of bits in the binary
	for x in range(0, 2**num_inputs): #2^num_inputs is the number of different inputs variations which need to be calcualted for the truth table
		variations.append(int_to_bin(x, num_inputs))
	return variations
		
func all_input_values():
	#output all nodes which are inputs
	var input_nodes = {}
	for x in global.entities:
		if global.entities[x].gateType == "input":
			input_nodes[x] = global.entities[x]
	return input_nodes

func all_output_nodes():
	#output all logic gates nodes which dont send a signal anywehre else
	#in other words, these are the final outputs which need to be looked at in the truth tables
	var output_nodes = {}
	for x in global.entities:
		if global.entities[x].gateType != "input":
			output_nodes[x] = global.entities[x]
	var final_output_nodes = {}
	for x in output_nodes:
		var output = true
		for connection in global.connections:
			if connection.pos1_name == x:
				output = false
		if output:
			final_output_nodes[x] = output_nodes[x]
	return final_output_nodes
