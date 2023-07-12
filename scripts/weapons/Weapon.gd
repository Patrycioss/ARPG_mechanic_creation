extends Sprite2D
class_name Weapon
var w_owner : Entity

@export var cooldown_seconds = 0
@export var strength = 1
@onready var timer = $Timer

func _ready():
	timer.one_shot = true

func _process(_delta : float):
	if Input.is_action_pressed("attack"):
		if abs(timer.get_time_left()) <= 0.0001:
			_use()
			timer.start(cooldown_seconds)

func _use():
	pass
