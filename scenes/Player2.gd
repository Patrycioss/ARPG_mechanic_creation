extends Entity

@export var speed = 400

var screen_size
var right_x_scale

func _ready():
	right_x_scale = sprite.scale.x
	var a = sprite.get_viewport()
	if a != null:
		var b = a.get_visible_rect()
		if b != null:
			screen_size = b.size

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

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed

	
	rigidbody.position += velocity * delta;
	rigidbody.position.x = clamp(rigidbody.position.x, 0, screen_size.x)
	rigidbody.position.y = clamp(rigidbody.position.y, 0, screen_size.y)
	
	
