class_name Entity
extends Node2D

@export_category("ID")
@export var _name : String
@export var _sender_texture : Texture

var 

@export_category("STATS")
@export var _start_health = 3
@export var damageable : bool = true

var health : Health

@onready var sprite = $Area2D/Sprite2D
@onready var area = $Area2D

signal on_hit



func _init():
	print("jep")
	health = Health.new(_start_health)
	health.on_death.connect(_on_death)
	health.amount_changed.connect(_on_health_change)
	
 
func _on_death():
	pass
	
func _on_health_change():
	pass
	
func hit(amount : int):
	on_hit.emit()
	if damageable:
		health.damage(amount)
