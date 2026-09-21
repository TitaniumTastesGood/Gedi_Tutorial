@abstract
extends CharacterBody2D

var hp
var horizontal_speed = 0
var vertical_speed = 0
var facing_direction = Vector2.LEFT
var auto_turnaround = false
var has_control = true
const GRAVITY = 22

func _ready():
	pass

func apply_knockback():
	has_control = false
	if facing_direction == Vector2.LEFT:
		horizontal_speed = 100
	else:
		horizontal_speed = -100
	vertical_speed = -100
	await get_tree().create_timer(0.6).timeout
	has_control = true
	horizontal_speed = 0

@abstract
func attack()

func gain_invincibility_frames():
	get_node("Hitbox/CollisionShape2D").set_deferred("disabled", true)
	await get_tree().create_timer(1.4).timeout
	get_node("Hitbox/CollisionShape2D").set_deferred("disabled", false)

func take_damage(damage:int):
	hp -= damage
	check_if_dead()

func check_if_dead():
	if hp <= 0:
		die()

func die():
	get_tree().queue_delete(self)

func _physics_process(_delta):
	if !is_on_floor():
		vertical_speed += GRAVITY
	velocity = Vector2(horizontal_speed, vertical_speed)
	move_and_slide()
	if is_on_wall():
		if auto_turnaround:
			facing_direction = Vector2.ZERO - facing_direction
