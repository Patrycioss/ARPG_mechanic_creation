extends Entity

@export var speed = 400
@export var animation_player : AnimationPlayer

var screen_size
var right_x_scale

func _ready():
	super._ready()
	right_x_scale = sprite.scale.x
	var a = sprite.get_viewport()
	if a != null:
		var b = a.get_visible_rect()
		if b != null:
			screen_size = b.size

func _process(_delta):
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

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	elif velocity.length() == 0:
		animation_player.play("walkDown")
		animation_player.pause()
		

	if velocity.y <= 0.5 && velocity.y >= -0.5:
		animation_player.play("walkLeft")
		
	elif velocity.y > 0.5:
		animation_player.play("walkDown")

	elif velocity.y < -0.5:
		animation_player.play("walkUp")
			
	position += velocity * _delta

#	rigidbody.apply_force(velocity)
#	rigidbody.position += velocity * delta;
#	rigidbody.position.x = clamp(rigidbody.position.x, 0, screen_size.x)
#	rigidbody.position.y = clamp(rigidbody.position.y, 0, screen_size.y)
