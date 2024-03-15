extends Control

var output_nodes
var input_nodes
var output_values =[]
var all_input_variations = []
#var input_values = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func get_truth_table_values(): #this is very similar to _on_visibility_change, this will be called when playing levels to check if the user has completed the level or not
	output_nodes = null
	input_nodes = null
	output_values = []
	all_input_variations = []
	
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
	
	#output(all_input_variations, output_values)
	return output_values

func _on_visibility_changed():
	output_nodes = null
	input_nodes = null
	output_values = []
	all_input_variations = []
	if visible:
		global.truth_table = true
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
		
		
		if global.current_mode == "levels": #if currently playing levels...
			levels_output(global.curr_level.input_variations, output_values)
		else:
			output(all_input_variations, output_values)
	else:
		global.truth_table = false



func levels_output(all_input_variations, output_values):
	
	var input = Label.new()
	var output = Label.new()
	
	input.modulate = Color(0,0,0)
	output.modulate = Color(0,0,0)
	
	input.text = "Inputs"
	output.text = "Outputs"
	
	get_node("ScrollContainer/GridContainer").add_child(input)
	get_node("ScrollContainer/GridContainer").add_child(output)
	
	
	
	for x in range (len(all_input_variations)):
		var dash = Label.new()
		dash.modulate = Color(0,0,0)
		dash.text = "--------"
		get_node("ScrollContainer/GridContainer").add_child(dash)
		
		var dash2 = Label.new()
		dash2.modulate = Color(0,0,0)
		dash2.text = "--------"
		get_node("ScrollContainer/GridContainer").add_child(dash2)
		
		
		var a = Label.new()
		var b = Label.new()
		
		#var open_sans = load("res://Assets/Open_Sans/OpenSans-VariableFont_wdth,wght.ttf")

		if (len(global.correct_truth_table) == len(output_values)):
			if global.correct_truth_table[x] == output_values[x]:
				a.modulate = Color(0,255,0)
				b.modulate = Color(0,255,0)
				a.text = dictionary_to_string(all_input_variations[x])
				get_node("ScrollContainer/GridContainer").add_child(a)
		
		
				b.text = dictionary_to_string(output_values[x])
				get_node("ScrollContainer/GridContainer").add_child(b)
			else:
				a.modulate = Color(255, 0, 0)
				b.modulate = Color(255, 0, 0)

				a.text = dictionary_to_string(all_input_variations[x])
				print(a.text)
				get_node("ScrollContainer/GridContainer").add_child(a)
		
		
				b.text = dictionary_to_string(output_values[x])
				get_node("ScrollContainer/GridContainer").add_child(b)
				var c = Label.new()
				c.text = " "
				get_node("ScrollContainer/GridContainer").add_child(c)
				
				var d = Label.new()
				d.text = dictionary_to_string(global.correct_truth_table[x])
				d.modulate = Color(0,255,0)
				get_node("ScrollContainer/GridContainer").add_child(d)
		else:
			a.modulate = Color(255, 0, 0)
			b.modulate = Color(255, 0, 0)
			a.text = dictionary_to_string(all_input_variations[x])
			get_node("ScrollContainer/GridContainer").add_child(a)
			b.text = "N/A"
			get_node("ScrollContainer/GridContainer").add_child(b)
			var c = Label.new()
			c.text = " "
			get_node("ScrollContainer/GridContainer").add_child(c)
			
			var d = Label.new()
			d.text = dictionary_to_string(global.correct_truth_table[x])
			d.modulate = Color(0,255,0)
			get_node("ScrollContainer/GridContainer").add_child(d)
		

func output(all_input_variations, output_values):

	var input = Label.new()
	input.modulate = (Color(0,0,0))
	input.text = "Inputs"
	get_node("ScrollContainer/GridContainer").add_child(input)
	
	var output = Label.new()
	output.modulate = (Color(0,0,0))
	output.text = "Outputs"
	get_node("ScrollContainer/GridContainer").add_child(output)
	
	for x in range (len(output_values)):
		var dash = Label.new()
		dash.modulate = Color(0,0,0)
		dash.text = "--------"
		get_node("ScrollContainer/GridContainer").add_child(dash)
		
		var dash2 = Label.new()
		dash2.modulate = Color(0,0,0)
		dash2.text = "--------"
		get_node("ScrollContainer/GridContainer").add_child(dash2)
		
		
		
		
		var a = Label.new()
		var b = Label.new()
		
		var open_sans = load("res://Assets/Open_Sans/OpenSans-VariableFont_wdth,wght.ttf")
		a.modulate = Color(0,0,0)
		b.modulate = Color(0,0,0)
		
		a.text = dictionary_to_string(all_input_variations[x])
		get_node("ScrollContainer/GridContainer").add_child(a)
		
		
		b.text = dictionary_to_string(output_values[x])
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
	var count = len(global.inputs_used) -1 
	var output = {}
	for x in range(bits, 0, -1):
		if num >= 2**(x-1):
			output[global.inputs_used[count]] = true
			num -= 2**(x-1)
		else:
			output[global.inputs_used[count]] = false
		count -= 1
		#print(output)
	return output

func input_variations():
	var variations = []  #a list of dicitonaries which will be the binary numbers
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
