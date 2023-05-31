class_name DialogueManager
extends Control

@onready var label : Label = $Label
"text"
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
		
	_display_string(_current_dialogue.next_message())
			
func _display_string(pString : String):
	label.text = pString	

func _process(_delta):
	if Input.is_action_just_pressed("Next"):
		_advance()