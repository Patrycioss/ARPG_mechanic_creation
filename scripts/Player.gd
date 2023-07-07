extends Entity

@export var speed = 400
@export var animation_player : AnimationPlayer
@export var dialogue_manager : DialogueManager

var screen_size
var right_x_scale

@export var interact_range : float = 1

func _ready():
	super._ready()
	right_x_scale = sprite.scale.x
	var a = sprite.get_viewport()
	if a != null:
		var b = a.get_visible_rect()
		if b != null:
			screen_size = b.size

func _input(event):
	if event.is_action_pressed("interact"):
		var sDist = 9999999
		var cEntity = null
		
		for entity in game_manager.get_entities():
			if entity == self: 
				continue
			var dist = entity.position.distance_to(position)
			if cEntity == null || dist < sDist:
				cEntity = entity
				sDist = dist
	
		print(sDist)
		if sDist <= interact_range:
			print("yep2")
			cEntity.interact()		

func _physics_process(_delta):
	var sDist = 9999999
	var cEntity = null
	
	for entity in game_manager.get_entities():
		if entity == self: 
			continue
		var dist = entity.position.distance_to(position)
		if cEntity == null || dist < sDist:
			cEntity = entity
			sDist = dist
			
		if sDist <= interact_range:
			cEntity.ping_in_range()

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
