class_name Health

@export var start_amount = 1
@export_category("If -1 takes start_amount as max health")
@export var max_health = -1

signal on_death
signal on_revive
signal amount_changed

var _amount : int = 0
	

func _init(p_start_health : int):
	_amount = p_start_health
	if max_health == -1:
		max_health = p_start_health
	amount_changed.emit()
	
func damage(pDamage : int):
	print("ja")
	if is_dead(): return
	
	_amount -= pDamage
	
	if _amount <= 0:
		_amount = 0	
		on_death.emit()
		
	amount_changed.emit()
	
func is_dead() -> bool:
	return (_amount <= 0)

func heal(pHealth : int, pRevive : bool = false):
	
	var dead = is_dead()
	
	if dead && not pRevive:
		return
			
	_amount += pHealth
	if _amount > max_health:
		_amount = max_health
	
	if dead:
		on_revive.emit()
		
	amount_changed.emit()
