@abstract
extends Node

var enemies_left
var spawn_timer = 0
var spawn_time = 0
var spawns
var spawned

func _process(delta):
	spawn_time -= delta
	if spawn_time <= 0 and enemies_left >= 0:
		if spawned == null:
			var guy = spawns.instantiate()
			guy.position = self.position
			spawned = guy
			$/root/Root.spawn_enemy(guy)
			enemies_left -= 1
		spawn_time = spawn_timer
