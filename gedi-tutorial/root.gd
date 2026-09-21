extends Node2D

func _ready():
	pass

func spawn_enemy(enemy):
	add_child(enemy)
