extends Entity

@export var target : Entity 
@export var speed = 300
@export var attack_damage = 1
@export var attack_range : float = 50
@export var attack_cooldown_seconds : int = 2

var all_objects
var attack_cooldown_timer : Timer
var can_attack : bool = true


func _ready():
	super._ready()
	if target == null: 
		target = game_manager.get_player()
		
	if attack_cooldown_timer == null:
		attack_cooldown_timer = Timer.new()
		attack_cooldown_timer.timeout.connect(_on_attack_timer_finished)
		add_child(attack_cooldown_timer)

func _on_attack_timer_finished():
	can_attack = true
		
func _try_attack():
	if can_attack:
		can_attack = false
		_attack()
		attack_cooldown_timer.start(attack_cooldown_seconds)
	
func _attack():
	target.health.damage(attack_damage)
	pass

#func _on_health_change():

func _physics_process(_delta):
	if target == null: return
	var u_direction = (target.position - position).normalized()	
	position += u_direction * (speed * _delta)
	
	if target.position.distance_to(position) <= attack_range:
		_try_attack()

func _on_death():
	queue_free()
	pass
