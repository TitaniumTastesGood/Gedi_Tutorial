extends Node

var enemies_left = 3
var spawn_timer = 6
var spawn_time = 0
var spawned

func _ready():
	pass

func _process(delta):
	spawn_time -= delta
	if spawn_time <= 0 and enemies_left >= 0:
		if spawned == null:
			var guy
			if randi() % 2 == 0:
				guy = load("res://walker_enemy.tscn").instantiate()
			else:
				guy = load("res://thrower_enemy.tscn").instantiate()
			guy.position = self.position
			spawned = guy
			$/root/Root.spawn_enemy(guy)
			enemies_left -= 1
		spawn_time = spawn_timer
