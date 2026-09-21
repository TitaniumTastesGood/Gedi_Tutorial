extends Area2D

var move_dir = Vector2.ZERO
var shooter
var damage = 1
var piercing = false
var horizontal_move = 0
var vertical_move = 0
var half_life = 4

func _physics_process(delta):
	half_life -= delta
	if half_life <= 0:
		destroy()
	position += Vector2(horizontal_move, vertical_move)

func destroy():
	get_tree().queue_delete(self)
