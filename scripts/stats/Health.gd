class_name Health
extends Node

@export var start_amount = 1
@export_category("If -1 takes start_amount as max health")
@export var max_health = -1

signal on_death
signal amount_changed

var _amount : int = 0

func _init():
	_amount = start_amount
	if max_health == -1:
		max_health = start_amount
	amount_changed.emit()
	
func damage(pDamage : int):
	_amount -= pDamage
	if _amount <= 0:
		_amount = 0	
		on_death.emit()
	amount_changed.emit()
	
func is_dead() -> bool:
	return (_amount > 0)

func heal(pHealth : int):
	_amount += pHealth
	if _amount > max_health:
		_amount = max_health
	amount_changed.emit()
