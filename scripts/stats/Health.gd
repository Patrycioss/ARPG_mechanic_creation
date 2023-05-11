class_name Health
extends Node

@export var start_amount = 1
@export_category("If -1 takes start_amount as max health")
@export var max_health = -1

var _amount : int = 0

func _init():
	_amount = start_amount
	if max_health == -1:
		max_health = start_amount
	
func damage(damage_ : int):
	_amount -= damage_
	if _amount < 0:
		_amount = 0	
	
func is_dead() -> bool:
	return (_amount > 0)
