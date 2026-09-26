extends Node

var guys_killed = 0
var score = 0

func _ready():
	pass

func gain_score(amount:int):
	score += amount
	$/root/Root/Score_Text.text = str(score).pad_zeros(7)

func check_for_win():
	guys_killed += 1
	if guys_killed >= 12:
		$/root/Root/You_Win_Text.visible = true
