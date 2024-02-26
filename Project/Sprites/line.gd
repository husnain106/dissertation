extends Line2D

var pos1:Vector2   #position of where the line starts
var pos2:Vector2   #position of where the line ends

var pos1_name    #the entity name at pos1
var pos2_name    #the entity name at pos2

var path

func _ready():
	update()
	global.connections.append(self)

func update_coordinates(pos_difference, pos):
	if pos == "pos1":
		pos1 -= pos_difference
	elif pos == "pos2":
		pos2 -= pos_difference
	update()

func update():
		var array = PackedVector2Array([pos1, Vector2((pos1[0] + pos2[0])/2, pos1[1]), Vector2((pos1[0] + pos2[0])/2, pos2[1]), Vector2(pos2[0], pos2[1])])
		self.set_points(array)
