extends Node2D

var inputs_coordinates
var output_coordinates
var inputs_available
var gateType

func input_available():
	if inputs_available >0:
		return true
	return false

func add_input_coordinates(vector):
	inputs_coordinates.append(vector)

func add_output_coordiantes(vector):
	output_coordinates.append(vector)

func assign_name():
	self.name = gateType + str(global.counts[gateType])
	global.counts[gateType] += 1
	
