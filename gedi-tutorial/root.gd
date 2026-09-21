extends Node2D

func _ready():
	randomize()

func spawn_enemy(enemy):
	add_child(enemy)

func check_for_win():
	for spawner in get_node("Enemy_Spawners").get_children():
		if spawner.enemies_left >= 0:
			return false
	$Label.visible = true
