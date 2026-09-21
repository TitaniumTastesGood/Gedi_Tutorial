extends "res://creature.gd"

const SPEED = 200
const JUMP_FORCE = 700
var airborne = true
var can_fire = true

func _ready():
	hp = 24
	facing_direction = Vector2.RIGHT

func take_damage(damage:int):
	hp -= damage
	apply_knockback()
	gain_invincibility_frames()
	check_if_dead()

func attack():
	can_fire = false
	var bullet = load("res://bullet.tscn").instantiate()
	bullet.position = self.position + (facing_direction * 30)
	bullet.move_dir = facing_direction
	bullet.horizontal_move = facing_direction.x * 7
	bullet.shooter = self
	get_parent().add_child(bullet)
	await get_tree().create_timer(0.3).timeout
	can_fire = true

func _process(_delta):
	if has_control:
		if Input.is_action_just_pressed("jump"):
			if is_on_floor():
				vertical_speed = 0-JUMP_FORCE
		if Input.is_action_pressed("shoot"):
			if can_fire:
				attack()
		if Input.is_action_pressed("right"):
			if has_control:
				horizontal_speed = SPEED
				facing_direction = Vector2.RIGHT
		elif Input.is_action_pressed("left"):
			if has_control:
				horizontal_speed = 0-SPEED
				facing_direction = Vector2.LEFT
		else:
			if has_control:
				horizontal_speed = 0

func _on_hitbox_area_entered(area):
	if "shooter" in area:
		if area.shooter != self:
			take_damage(area.damage)
			if !area.piercing:
				area.destroy()

func _on_hitbox_body_entered(body):
	if body == self:
		return
	if body.deals_contact_damage:
		take_damage(body.damage)
