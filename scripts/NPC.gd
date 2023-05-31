extends Entity

@onready var dialogue_manager = $DialogueManager

@export var messages : Array
@export var dialogue : Dialogue

func _ready():
	on_hit.connect(_on_hit)
	
	dialogue_manager.add_dialogue()

func _on_hit():
	pass


