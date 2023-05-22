extends Entity

@export var target : Entity 
@export var speed = 300

@export var attack_range : float = 50
@export var attack_cooldown_seconds : int = 2

var all_objects

var attack_cooldown_timer : Timer

#func _init():
#	attack_cooldown_timer = Timer.new()
#	attack_cooldown_timer.one_shot = false

func _ready():
	if target == null: 
		print("No target selected for " + name)
		
func try_attack() -> bool:
	if abs(attack_cooldown_timer.get_time_left()) <= 0.0001:
		attack()
		attack_cooldown_timer.start(attack_cooldown_seconds)
		return true
	else: 
		return false	

func attack():
	print(name + " attacks")
	pass


func _physics_process(_delta):
#	try_attack()
	
	if target == null: 
		return
	var u_direction = (target.position - position).normalized()	
	position += u_direction * (speed * _delta)


func _on_death():
	print(name + " died")
	queue_free()
	pass
