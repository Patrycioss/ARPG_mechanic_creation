class_name Entity
extends Node2D

var game_manager : GameManager

#@export_category("ID")
@export var _name : String
@export var _ID_picture : Texture

var _ID : ID

@export var healthbar : Sprite2D

@export_category("STATS")
@export var _start_health : int
@export var damageable : bool = true

var health : Health
var weapon : Weapon

@onready var sprite = $Area2D/Sprite2D
@onready var area = $Area2D

@onready var entity_dict = get_node("/root/EntityDict")

signal on_hit

var in_range : bool = false
var ping_timer
var _base_healthbar_scale
		
func update_healthbar():
	var newScale = _base_healthbar_scale
	newScale.x = health._amount * (_base_healthbar_scale.x / health.max_health)
	healthbar.scale = newScale
	
func _ready():
	health = Health.new(_start_health)
	health.on_death.connect(_on_death)
	health.amount_changed.connect(_on_health_change)
	
	if weapon != null:
		weapon.w_owner = self
	
	entity_dict = entity_dict as EntityDict
	_ID = ID.new(_name, _ID_picture)
	entity_dict.entities[_name] = self	
	
	if healthbar:
		_base_healthbar_scale = healthbar.get_transform().get_scale()
		health.amount_changed.connect(update_healthbar)

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

func interact():
	pass
