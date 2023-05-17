extends Weapon

@onready var animation_player = $AnimationPlayer

func _ready():
	var swing_length = animation_player.get_animation("swing").length
	cooldown_seconds = swing_length
	super._ready()

func use():
	animation_player.play("swing")
	

func _on_animation_player_animation_finished(anim_name):
	match anim_name:
		"swing": animation_player.play("idle")


func _on_area_2d_area_entered(area):
	print(area)
	var entity := area.owner as Entity
	print(entity)


	if not entity:
		return

	entity.health.damage(strength)
