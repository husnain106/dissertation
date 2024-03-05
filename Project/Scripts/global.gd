extends Node2D

var current_mode = null

var deleting = false
var deleting_node = null

var linking = false

var input = null
var input_name = null

var output = null
var output_name = null

var all_input_names = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
var inputs_used = []

var truth_table = false

var number_inputs = 0
var entities = {}
var counts = {
	"and" : 0,
	"or" : 0,
	"not" : 0}

var connections = []

var all_values = []

var level_number = 1
var change_scene_to = null


var correct_truth_table = []
