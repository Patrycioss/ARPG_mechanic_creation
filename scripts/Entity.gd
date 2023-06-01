class_name Entity
extends Node2D

#@export_category("ID")
@export var _name : String
@export var _ID_picture : Texture

var _ID : ID


@export_category("STATS")
@export var _start_health = 3
@export var damageable : bool = true

var health : Health

@onready var sprite = $Area2D/Sprite2D
@onready var area = $Area2D

@onready var entity_dict = get_node("/root/EntityDict")

signal on_hit


func _init():
	health = Health.new(_start_health)
	health.on_death.connect(_on_death)
	health.amount_changed.connect(_on_health_change)
	
func _ready():
	entity_dict = entity_dict as EntityDict
	_ID = ID.new(_name, _ID_picture)
	entity_dict.entities[_name] = self	
	print("now entity with name %s" %_name)

func get_ID():
	return _ID	
 
func _on_death():
	pass
	
func _on_health_change():
	pass
	
func hit(amount : int):
	on_hit.emit()
	if damageable:
		health.damage(amount)
