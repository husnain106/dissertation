extends Node2D

var linking = false

var input = null
var input_name = null

var output = null
var output_name = null

var entities = {}
var counts = {
	"and" : 0,
	"or" : 0,
	"not" : 0}

var connections = []
