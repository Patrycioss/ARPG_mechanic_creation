extends Entity
class_name Interactable

@onready var interact_indicator = $Interact

func on_out_of_range():
	interact_indicator.visible = false
	pass
	
func on_in_range():
	interact_indicator.visible = true
	pass

func _ready():
	interact_indicator.visible = false

func _physics_process(_delta):
	if ping_timer == null: 
		return
	if ping_timer.time_left == 0:
		on_out_of_range()
	
	
	
func ping_in_range():
	on_in_range()
	
	if ping_timer == null:
		ping_timer = Timer.new()
		add_child(ping_timer)
		ping_timer.start(0.1)
		ping_timer.timeout.connect(on_out_of_range)
	else:
		ping_timer.stop()
		ping_timer.start(0.1)
	
	pass
