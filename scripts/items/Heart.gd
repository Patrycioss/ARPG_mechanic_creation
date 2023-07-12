extends Item

@export var heal_amount : int = 1

func _on_pickup(target : Entity):
	target.health.heal(heal_amount)
