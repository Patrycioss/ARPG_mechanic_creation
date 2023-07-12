extends Node
class_name Item

@export var _pickup_range = 10
var game_manager : GameManager

func get_pickup_range():
	return _pickup_range

func pickup(target : Entity):
	_on_pickup(target)
	queue_free()
	pass

func _on_pickup(_target : Entity):
	pass
