extends Sprite2D

@export var cooldown_seconds = 0
@export var strength = 1

@onready var timer = $Timer

func _ready():
	timer.one_shot = true


func _process(_delta : float):
	if Input.is_action_pressed("attack"):
		try_use()

func use():
	pass

func try_use() -> bool:
	if abs(timer.get_time_left()) <= 0.0001:
		use()
		timer.start(cooldown_seconds)
		return true
	else: 
		return false		
