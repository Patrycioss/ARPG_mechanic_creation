class_name Health

var max_health
var _amount : int = 0

signal on_death
signal on_revive
signal amount_changed


func _init(p_start_health : int, p_max_health : int = -1):
	_amount = p_start_health
	if p_max_health == -1: max_health = p_start_health
	amount_changed.emit()
	
func damage(pDamage : int):
	if is_dead(): return
	_amount -= pDamage
	amount_changed.emit()
	
	if _amount <= 0:
		_amount = 0	
		on_death.emit()
		
	
func is_dead() -> bool:
	return (_amount <= 0)

func heal(pHealth : int, pRevive : bool = false):
	var dead = is_dead()
	if dead && not pRevive: return
	_amount += pHealth
	if _amount > max_health: _amount = max_health
	if dead: on_revive.emit()
	amount_changed.emit()
