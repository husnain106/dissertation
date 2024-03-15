extends Node2D

var _username

var _gold = 500
var _level = 1

var _gates_theme = "first_draft"

var _owned_themes = {"first_draft": true,
"blue": false,
"green": false,
"red": false}

var _daily_challenge = []
var _weekly_challenge = []

func add_daily_challenge(challenge):
	self._daily_challenge.append(challenge)
	save()
func finish_daily_challenge(challenge):
	self._daily_challenge.erase(challenge)
	save()
func get_daily_challenge():
	return self._daily_challenge

func add_weekly_challenge(challenge):
	self._weekly_challenge.append(challenge)
	save()
func finish_weekly_challenge(challenge):
	self._weekly_challenge.erase(challenge)
	save()
func get_weekly_challenge():
	return self._weekly_challenge

func set_username(name):
	self._username = name
	save()
func get_username():
	return self._username 

func set_gold(num):
	self._gold = num
	save()
func get_gold():
	return self._gold

func set_level(num):
	self._level = num
	save()
func get_level():
	return self._level

func set_gates_theme(theme):
	self._gates_theme = theme
	save()
func get_gates_theme():
	return self._gates_theme

func bought_theme(theme):
	self._owned_themes.erase(theme)
	self._owned_themes[theme] = true
	save()
func get_owned_themes(theme):
	return self._owned_themes[theme]
func get_all_owned_themes():
	return self._owned_themes


func save():
	var text = (self._username + "\n" + str(self._gold) + "\n" + str(self._level) + "\n" + self._gates_theme + "\n")
	if len(self._daily_challenge)>= 1:
		text = text + str(self._daily_challenge[0].initial_level) + "\n"
	for x in self._owned_themes:
		if self._owned_themes[x]:
			text = text + x + "\n"
	
	var user_res = "res://user_data.txt"
	var file = FileAccess.open(user_res, FileAccess.WRITE)
	file.store_string(text)
	
