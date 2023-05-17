class_name Entity
extends Node

@export var _start_health = 3

@onready var health = Health.new(_start_health)

@onready var rigidbody = $RigidBody2D
@onready var sprite = $RigidBody2D/Sprite2D


func _ready():
	if rigidbody == null:
		push_error("Make sure entity with name: {" + name + "} node has a Rigidbody2D")
