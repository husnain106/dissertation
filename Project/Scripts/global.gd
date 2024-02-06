extends Node2D

var linking = false

var input = null
var output = null

var entities = {}
var counts = {
	"and" : 0,
	"or" : 0,
	"not" : 0}
