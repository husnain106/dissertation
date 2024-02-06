extends Node2D

var dragging = false
var draggable = false
var offset = Vector2(0,0)

var gateType
var inputs_available
var inputs_coordinates
var output_coordinates

func _process(delta):
	if dragging and not global.linking:
		var newPos = get_global_mouse_position() - offset
		position = newPos


func _on_button_button_down():
	if draggable and not global.linking:
		dragging = true
		offset =  get_global_mouse_position() - global_position


func _on_button_button_up():
	dragging = false


func _on_area_2d_mouse_entered():
	draggable = true
	scale = Vector2(1.05, 1.05)


func _on_area_2d_mouse_exited():
	draggable = false
	scale = Vector2(1,1)

func assign_name():
	name = gateType + str(global.counts[gateType])
	global.counts[gateType] += 1

func _on_button_pressed():
	if global.linking:
		print(name)
		if global.input == null:
			global.input = global_position + output_coordinates
			print(global.input)
		elif global.output == null:
			if inputs_available == 2:
				global.output = global_position + inputs_coordinates[0]
				inputs_available -= 1
			elif inputs_available == 1:
				global.output = global_position + inputs_coordinates[1]
				inputs_available -= 1
			else:
				print("Cannot connect, no inputs remaining")
			print(global.output)
		else:
			print("this should never happen")
