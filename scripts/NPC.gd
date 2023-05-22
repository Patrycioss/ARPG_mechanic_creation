extends Entity
@onready var dialogue_manager : DialogueManager = DialogueManager.new()


func _ready():
	on_hit.connect(_on_hit)

func _on_hit():
	pass


