extends Control

var current_gate

var gates_information ={

"not": "NOT gate is a logic gate that 
inverts the binary input which 
means that in order to get a 
high output (true) we require 
a low input (false) and for a 
low output a High input (true) is 
needed. It inverts the input 
or we can say it negates the 
output hence due to this 
inversion of output it is 
also called Inverter.",

"or": "The OR gate gets its name from 
behaving like the logical 
inclusive or. The output is 
true if one or both of the 
inputs are true. If both inputs 
are false, then the output is 
false. In other words, for the 
output to be true, at least 
one input must be true.",

"and": "An AND gate will return a true if, 
and only if, both of the inputs 
were a true. If either, or both, 
inputs are a false then the 
output will also be false."
}

func _ready():
	current_gate = null
	get_node("VBoxContainer/HBoxContainer/gate_information_label").text = " "


func _process(delta):
	if current_gate != null:
		get_node("VBoxContainer/HBoxContainer/gate_information_label").text = gates_information[current_gate]


func _on_not_button_pressed():
	current_gate = "not"


func _on_or_button_pressed():
	current_gate = "or"


func _on_and_button_pressed():
	current_gate = "and"
