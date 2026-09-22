extends Node2D

var guys_killed = 0

func _ready():
	randomize()

func spawn_enemy(enemy):
	add_child(enemy)

func check_for_win():
	guys_killed += 1
	if guys_killed >= 12:
		$You_Win_Text.visible = true
