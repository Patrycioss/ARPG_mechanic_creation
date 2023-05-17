class_name Entity
extends Node2D

@export var _start_health = 3

var health : Health

@onready var sprite = $Area2D/Sprite2D
@onready var area = $Area2D


func _init():
	print("jep")
	health = Health.new(_start_health)
	health.on_death.connect(_on_death)
	health.amount_changed.connect(_on_health_change)
 
func _on_death():
	pass
	
func _on_health_change():
	pass
