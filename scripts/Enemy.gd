extends RigidBody2D

@export var target : Node 

@onready var animated_sprite = $AnimatedSprite2D
@onready var information = $Entity


var all_objects

func _physics_process(delta):
	var u_direction = (target.position - position).normalized()	
	position += u_direction * delta * information.speed
