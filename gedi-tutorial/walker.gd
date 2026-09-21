extends "res://enemy.gd"

const SPEED = 120

func _ready():
	hp = 3
	damage = 4
	auto_turnaround = true

func attack():
	pass

func _physics_process(_delta):
	super(_delta)
	if facing_direction == Vector2.RIGHT:
		horizontal_speed = SPEED
	elif facing_direction == Vector2.LEFT:
		horizontal_speed = 0-SPEED
