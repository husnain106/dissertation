extends Control

var pos = Vector2(666/2, 374/2)
var pos2 = Vector2(0,0)
var node

var input_names_available = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]



func _on_and_gate_button_pressed():
	if not global.truth_table:
		node = load("res://Sprites/and_gate.tscn")
		var instance = node.instantiate()
		instance_of(instance)

func _on_or_gate_button_pressed():
	if not global.truth_table:
		node = load("res://Sprites/or_gate.tscn")
		var instance = node.instantiate()
		instance_of(instance)

func _on_not_gate_button_pressed():
	if not global.truth_table:
		node = load("res://Sprites/not_gate.tscn")
		var instance = node.instantiate()
		instance_of(instance)

func _on_new_input_button_pressed():
	node = load("res://Sprites/inputs.tscn")
	var instance = node.instantiate()
	if input_names_available.size()>0 and not global.truth_table:
		instance.get_child(1).text = input_names_available.pop_at(0)
		print(input_names_available)
		instance.name = instance.get_child(1).text
		global.inputs_used.append(instance.name)
		instance_of(instance)
		global.number_inputs += 1


func instance_of(instance):
	if get_parent():
		instance.position = pos
		get_parent().add_child(instance)
		instance.path = instance.get_path()
	else:
		instance.posiiton = pos2
		add_child(instance)
		instance.path = instance.get_path()

func _on_link_button_pressed():
	if not global.linking and not global.deleting and not global.truth_table:
		global.linking = true
		global.input = null
		global.output = null
		global.input_name = null
		global.output_name = null
		get_node("link_button").scale = Vector2(1, 1)
	elif global.linking and not global.truth_table:
		global.linking = false
		global.input = null
		global.output = null
		global.input_name = null
		global.output_name = null
		get_node("link_button").scale = Vector2(0.735,0.735)
	
func _process(delta):
	if global.deleting and global.deleting_node != null and not global.truth_table:
		delete(global.deleting_node)
		
		
		global.deleting = false
		global.deleting_node = null
	if global.linking and global.input != null and global.output != null and not global.truth_table:
		#var pos1 = global.input
		#var pos2 = global.output
		
		node = load("res://Sprites/line.tscn")
		var instance = node.instantiate()
		#var array = PackedVector2Array([pos1, Vector2((pos1[0] + pos2[0])/2, pos1[1]), Vector2((pos1[0] + pos2[0])/2, pos2[1]), Vector2(pos2[0], pos2[1])])
		
		#instance.set_points(array)
		instance.pos1 = global.input
		instance.pos2 = global.output
		
		instance.pos1_name = global.input_name
		instance.pos2_name = global.output_name
		
		get_parent().add_child(instance)
		instance.path = instance.get_path()
		global.linking = false
		get_node("link_button").scale = Vector2(0.735,0.735)
		global.input = null
		global.output = null
		global.input_name = null
		global.output_name = null
		


func _on_delete_button_pressed():
	if global.deleting and not global.truth_table:
		global.deleting = false
		get_node("delete_button").scale = Vector2(0.07, 0.07)
	elif not global.deleting and not global.linking and not global.truth_table:
		global.deleting = true
		get_node("delete_button").scale = Vector2(0.08, 0.08)
		

func delete(node):
	var deleted = 0
	if global.entities[node].gateType == "input":
		input_names_available.append(node)
		global.inputs_used.erase(node)
	
	
	#delete all connections
	for x in range(len(global.connections)):
		if global.connections[x-deleted].pos1_name == node:
			var pos2_name = global.connections[x-deleted].pos2_name
			global.entities[pos2_name].inputs_available += 1
			
			get_node(global.connections[x-deleted].get_path()).queue_free()
			global.connections.remove_at(x-deleted)
			deleted = deleted + 1
			
			for connection in global.connections:
				if connection.pos2_name == pos2_name:
					connection.pos2 = global.entities[pos2_name].global_position + global.entities[pos2_name].inputs_coordinates[0]
					connection.update()
		elif global.connections[x-deleted].pos2_name == node:
			get_node(global.connections[x-deleted].get_path()).queue_free()
			global.connections.remove_at(x-deleted)
			deleted = deleted + 1
	
	#delete the node itself
	get_node(global.entities[node].path).queue_free()
	global.entities.erase(node)
	get_node("delete_button").scale = Vector2(0.07, 0.07)
	
	
	for connection in global.connections:
		print(connection.pos1_name, "  ,  ", connection.pos2_name)
