extends "res://enemy.gd"

var attack_timer = 1.5
var attack_time

func _ready():
	super()
	hp = 5
	deals_contact_damage = false
	attack_time = attack_timer

func attack():
	var bullet = load("res://axe_bullet.tscn").instantiate()
	bullet.position = self.position + Vector2(0, -3)
	bullet.move_dir = facing_direction
	bullet.piercing = true
	bullet.damage = 3
	bullet.horizontal_move = (player.position.x - self.position.x)/90
	if bullet.horizontal_move <= -9:
		bullet.horizontal_move = -9
	elif bullet.horizontal_move >= 9:
		bullet.horizontal_move = 9
	bullet.vertical_move = -9
	bullet.shooter = self
	get_parent().add_child(bullet)

func _process(delta):
	if player.position.x < self.position.x:
		facing_direction = Vector2.LEFT
	elif player.position.x > self.position.x:
		facing_direction = Vector2.RIGHT
	attack_time -= delta
	if attack_time <= 0:
		attack_time = attack_timer
		attack()
