@abstract
extends CharacterBody2D

const GRAVITY = 11

func _ready():
	velocity.y = -140

func _physics_process(_delta):
	if !is_on_floor():
		velocity.y += GRAVITY
	move_and_slide()

func _on_hitbox_area_entered(area):
	area = area.get_parent()
	if area.name == "Player":
		pickup_effect(area)
		get_tree().queue_delete(self)

@abstract
func pickup_effect(player)
