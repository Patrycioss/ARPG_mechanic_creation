extends "res://scripts/weapons/Weapon.gd"

@onready var animation_player = $AnimationPlayer

func _ready():
	var swing_length = animation_player.get_animation("swing").length
	print(swing_length)
	
	cooldown_seconds = swing_length
	super._ready()

func use():
#	play("swing")
	animation_player.play("swing")
	


func _on_area_2d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	print(body_rid)
	print(body)

	print(body_shape_index)
	print(local_shape_index)
	print("ha")
	pass # Replace with function body.
