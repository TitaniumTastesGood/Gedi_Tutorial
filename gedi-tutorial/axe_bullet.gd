extends "res://bullet.gd"

const GRAVITY = 0.24

func _physics_process(delta):
	super(delta)
	vertical_move += GRAVITY
