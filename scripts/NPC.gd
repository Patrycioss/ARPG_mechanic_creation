extends Interactable
class_name NPC

@export_file var dialogue_path
@export var messages : Array

@onready var dialogue_builder : DialogueBuilder = $DialogueBuilder

var _dialogue : Dialogue
var _dialogue_built = false

func _ready():
	super._ready()
	on_hit.connect(_on_hit)
	game_manager.get_dialogue_manager().connect_npc(self)
	
func interact():
	game_manager.get_dialogue_manager().play_dialogue(_dialogue)	

func _physics_process(_delta):
	super._physics_process(_delta)
	if not _dialogue_built:
		_dialogue = dialogue_builder.build_from_text_file(dialogue_path)
		_dialogue_built = true
		
func _on_hit():
	pass	
