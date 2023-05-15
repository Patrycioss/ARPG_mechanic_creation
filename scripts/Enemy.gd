extends RigidBody2D

@export var target : Node 
@export var speed = 300
@export var revivable : bool = true
@onready var animated_sprite = $AnimatedSprite2D
@onready var entity = $Entity


var all_objects

func _physics_process(delta):
	var u_direction = (target.position - position).normalized()	
	position += u_direction * delta * speed


func _on_health_on_death():
	print(name + " died")
	queue_free()

