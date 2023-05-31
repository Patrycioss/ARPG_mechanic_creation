extends Entity

@export var dialogue_manager : DialogueManager

@export_file var dialogue_path

@export var messages : Array

func _ready():
	on_hit.connect(_on_hit)
	
#	print(Dialogue.make_from_text_file(dialogue_path))
	
	
	var dialogue = Dialogue.make_from_text_file(dialogue_path)
	dialogue.print_contents()
	dialogue_manager.add_dialogue(dialogue)

func _on_hit():
	pass


