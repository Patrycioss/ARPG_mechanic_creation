extends "res://scripts/weapons/Weapon.gd"

@onready var animation_player = $AnimationPlayer

func _ready():
	var swing_length = animation_player.get_animation("swing").length
	print(swing_length)
	
	cooldown_seconds = swing_length
	super._ready()

func use():
	animation_player.play("swing")
	


#func _on_area_2d_body_shape_entered(_body_rid, _body, _body_shape_index, _local_shape_index):
#	print("_on_area_2d_body_shape_entered")


func _on_area_2d_body_entered(body):
	print(body)
	
	var entity := body.find_child("Entity") as Entity
	
	if not entity:
		return
		
	print("jep")
	
	entity.get_health().damage(1)


func _on_animation_player_animation_finished(anim_name):
	match anim_name:
		"swing": animation_player.play("idle")
		
