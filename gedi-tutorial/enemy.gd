@abstract
extends "res://creature.gd"

var player
var deals_contact_damage = true
var damage = 1
var score_value = 100

func _ready():
	player = get_parent().get_node("Player")
	super()

func die():
	super()
	player.gain_score(score_value)
	drop_powerup()

func _on_hitbox_area_entered(area):
	if "shooter" in area:
		if area.shooter == player:
			take_damage(area.damage)
			if !area.piercing:
				area.destroy()

func drop_powerup():
	var random_powerup = randi() % 8
	var powerup
	if random_powerup <= 3:
		powerup = load("res://score_ball.tscn").instantiate()
	elif random_powerup == 4:
		powerup = load("res://health_pickup.tscn").instantiate()
	elif random_powerup <= 6 and player.hp <= 4:
		powerup = load("res://health_pickup.tscn").instantiate()
	if powerup != null:
		powerup.position = self.position
		get_parent().call_deferred("add_child", powerup)
