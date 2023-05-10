extends AnimatedSprite2D

@export var cooldown_seconds = 2
@export var strength = 1

@onready var timer = $Timer

func _ready():
	timer.one_shot = true


func _process(_delta : float):
	if Input.is_action_pressed("attack"):
		print("ja")
		try_use()

func use():
	pass

func try_use() -> bool:
	print(timer.get_time_left())
	if abs(timer.get_time_left()) <= 0.001:
		print("nee")
		use()
		timer.start(cooldown_seconds)
		return true
	else: 
		return false		
