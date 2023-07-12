extends Entity
class_name Player

@export var speed = 400
@export var animation_player : AnimationPlayer

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

func _physics_process(_delta):
	var sDist = 9999999
	var cInteractable = null
	
	for interactable in game_manager.get_interactables():
		if not interactable: continue
		if interactable == self: 
			continue
		var dist = interactable.position.distance_to(position)
		
		if cInteractable == null || dist < sDist:
			cInteractable = interactable
			sDist = dist
			
	
	if cInteractable != null && sDist <= interact_range:
		cInteractable.ping_in_range()
		if Input.is_action_pressed("interact"):
			cInteractable.interact()
	
func _on_death():
	queue_free()				

func _process(_delta):
	var sDist = 999999
	var cItem : Item = null
	for item in game_manager.get_items():
		if not item: continue
		var dist = item.position.distance_to(position)
		if cItem == null || dist < sDist:
			cItem = item
			sDist = dist
			
	if cItem != null && cItem.get_pickup_range() >= sDist:
		print(sDist)
		cItem.pickup(self)
	
	
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
		animation_player.play("frisk_walkDown")
		animation_player.pause()
		

	if velocity.y <= 0.5 && velocity.y >= -0.5:
		animation_player.play("frisk_walkRight")
		
	elif velocity.y > 0.5:
		animation_player.play("frisk_walkDown")

	elif velocity.y < -0.5:
		animation_player.play("frisk_walkUp")
			
	position += velocity * _delta

#	rigidbody.apply_force(velocity)
#	rigidbody.position += velocity * delta;
#	rigidbody.position.x = clamp(rigidbody.position.x, 0, screen_size.x)
#	rigidbody.position.y = clamp(rigidbody.position.y, 0, screen_size.y)
