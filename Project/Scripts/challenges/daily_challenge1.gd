extends "res://Scripts/challenges/ChallengesClass.gd"

var target_level
var initial_level

func _init():
	reward = 50
	time_left = 24*60 #minutes in a day
	target_level = 4
	initial_level = 1

func check_if_complete():
	if User.get_level() >= 4:
		completed = true
		progress = 1
	else:
		progress = User.get_level()/ (target_level - initial_level)
