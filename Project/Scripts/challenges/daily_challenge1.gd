extends "res://Scripts/challenges/ChallengesClass.gd"

#This daily challenge is that the user should complete 5 levels that day

var target_level
var initial_level

func _init(initial_level):
	reward = 50 #50 gold reward for this level
	time_left = 24*60 #minutes in a day
	target_level = initial_level + 3  #the target is to complete 5 levels that day
	initial_level = initial_level #this is the level that the use is at the start of the day
	message = "Complete a level"

func check_if_complete():
	if User.get_level() >= target_level:
		completed = true
		progress = 1
		return true
	else:
		#progress = int(User.get_level())/ (int(target_level) - initial_level)
		completed = false
		return false
