extends Entity

@export var target : Entity 
@export var speed = 300

var all_objects

func _ready():
	if target == null: 
		print("No target selected for " + name)
		

func _physics_process(_delta):
	if target == null: 
		return
	var u_direction = (target.position - position).normalized()	
	position += u_direction * (speed * _delta)


func _on_death():
	print(name + " died")
	queue_free()
	pass
