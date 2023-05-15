class_name Entity
extends Node

@onready var _health = $Health
@onready var _inventory = $Inventory

func _ready():
	if _health == null:
		push_error("No health node for entity with name: " + get_parent().name)
	
	if _inventory == null:
		push_error("No inventory node for entity with name: " + get_parent().name)

func get_health() -> Health:
	return _health
	
func get_inventory() -> Inventory:
	return _inventory
