extends "res://scripts/Entity.gd"

@export var target : Entity 
@export var speed = 300


var all_objects

func _ready():
	if target == null: 
		print("No target selected for " + name)


func _physics_process(_delta):
	if target == null: 
		return
	var u_direction = (target.rigidbody.position - rigidbody.position).normalized()	
	rigidbody.apply_force(u_direction * speed)
#	rigidbody.position += u_direction * delta * speed


func _on_health_on_death():
	print(name + " died")
	queue_free()


func _on_rigid_body_2d_body_entered(body):
	print(body + " entered enemy")
	pass # Replace with function body.
