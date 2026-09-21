@abstract
extends "res://creature.gd"

var player
var deals_contact_damage = true
var damage = 1

func _ready():
	player = get_parent().get_node("Player")

func _on_hitbox_area_entered(area):
	if "shooter" in area:
		if area.shooter == player:
			take_damage(area.damage)
			if !area.piercing:
				area.destroy()
