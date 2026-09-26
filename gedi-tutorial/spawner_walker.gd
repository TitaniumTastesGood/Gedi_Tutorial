extends "res://spawn_factory.gd"

func _ready():
	enemies_left = 4
	spawn_timer = 3
	spawns = load("res://walker_enemy.tscn")
