extends Node2D

var dragging = false
var draggable = false
var offset = Vector2(0,0)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if dragging:
		var newPos = get_global_mouse_position() - offset
		position = newPos


func _on_button_button_down():
	if draggable:
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
	

