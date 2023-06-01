class_name DialogueManager
extends Control

@onready var label : Label = $Label
@onready var texture_rect : TextureRect = $TextureRect

var _dialogue_index : int = 0
var _dialogues : Array
var _current_dialogue : Dialogue

func dialogue_available():
	_dialogues[0].print_contents()
	
	if _dialogue_index < _dialogues.size() && _dialogue_index >= 0:
		return true
	else:
		return false

func add_dialogue(pDialogue : Dialogue):
	_dialogues.insert(_dialogues.size(), pDialogue)

func _advance():	
	
	if not _current_dialogue || not _current_dialogue.message_available():
		
		if dialogue_available():
			_current_dialogue = _dialogues[_dialogue_index]
			
			if not _current_dialogue.message_available():
				print("No message available")
				return
		else:
			print("No dialogue available!")
			return
		
	_display_message(_current_dialogue.next_message())
			
func _display_message(pMessage : Message):
	texture_rect.texture = pMessage.get_ID().picture
	label.text = pMessage.get_contents()	

func _process(_delta):
	if Input.is_action_just_pressed("Next"):
		_advance()
