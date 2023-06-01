extends Entity
class_name NPC

@export var dialogue_manager : DialogueManager

@export_file var dialogue_path

@export var messages : Array

@onready var dialogue_builder : DialogueBuilder = $DialogueBuilder

var _dialogue_built = false

func _ready():
	super._ready()
	on_hit.connect(_on_hit)
	

func _physics_process(delta):
	if not _dialogue_built:
		var dialogue = dialogue_builder.build_from_text_file(dialogue_path)
		dialogue.print_contents()
		dialogue_manager.add_dialogue(dialogue)
		_dialogue_built = true

func _on_hit():
	pass


