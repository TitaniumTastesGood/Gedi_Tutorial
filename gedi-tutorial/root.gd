extends Node2D

func _ready():
	randomize()

func spawn_enemy(enemy):
	add_child(enemy)
