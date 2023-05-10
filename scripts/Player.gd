extends Area2D

@export var speed = 400

#@onready var animatedSprite2D = $AnimatedSprite2D
@onready var screen_size = get_viewport_rect().size

@onready var sprite = $Sprite

@onready var right_x_scale = sprite.scale.x


func _process(delta):
	var velocity = Vector2.ZERO
	
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
		sprite.scale.x = right_x_scale
	
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
		sprite.scale.x = right_x_scale * -1
	
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	
#	if velocity.x != 0:
###		animatedSprite2D.animation = "walk"		
#
#		if velocity.x < 0:
#
#
#		sprite.flip_h = velocity.x < 0
##
#
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
#		animatedSprite2D.play()
#
#	else:
#		animatedSprite2D.stop()
	
	position += velocity * delta;
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	
	
