extends "res://spawn_factory.gd"

func _ready():
	enemies_left = 1
	spawns = load("res://thrower_enemy.tscn")
