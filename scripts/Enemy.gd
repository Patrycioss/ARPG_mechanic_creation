extends RigidBody2D



#Nodes
@onready var animated_sprite = $AnimatedSprite2D
@onready var information = get_node("Information")

@export_node_path("Area2D") var target_path
@onready var target = get_node(target_path)


func _physics_process(delta):
	var u_direction = (target.position - position).normalized()	
	position += u_direction * delta * information.speed
