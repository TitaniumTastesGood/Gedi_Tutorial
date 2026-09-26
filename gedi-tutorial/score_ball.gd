extends "res://powerup.gd"

func pickup_effect(_player):
	get_node("/root/GameManager").gain_score(1000)
