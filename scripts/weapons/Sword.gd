extends Weapon
class_name Sword
@onready var animation_player = $AnimationPlayer

func _ready():
	var swing_length = animation_player.get_animation("swing").length
	cooldown_seconds = swing_length
	super._ready()

func _use():
	animation_player.play("swing")

func _on_animation_player_animation_finished(anim_name):
	match anim_name:
		"swing": animation_player.play("idle")

func _on_area_2d_area_entered(area):
	var entity := area.owner as Entity
	if entity != null && entity.health != null: 
		entity.health.damage(strength)
