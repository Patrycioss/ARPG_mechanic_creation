class_name DialogueManager
extends Control

@onready var label : Label = $Label
@onready var texture_rect : TextureRect = $TextureRect

var _dialogues : Array
var _current_dialogue : Dialogue
var _connected_npcs : Array

func connect_npc(npc : NPC):
	_connected_npcs.insert(_connected_npcs.size(), npc)
	
func disconnect_npc(npc : NPC):
	var i = _connected_npcs.find(npc)
	if (i != -1):
		_connected_npcs.remove_at(i)

func get_connected_npcs():
	return _connected_npcs

func play_dialogue(pDialogue : Dialogue):
	_current_dialogue = Dialogue.new(pDialogue.messages)
	self.visible = true
	_display_message(_current_dialogue.next_message())


func add_dialogue(pDialogue : Dialogue):
	_dialogues.insert(_dialogues.size(), pDialogue)

func _advance():	
	if not self.visible: 
		return
	if _current_dialogue.message_available():
		_display_message(_current_dialogue.next_message())
	else:
		self.visible = false

func _display_message(pMessage : Message):
	texture_rect.texture = pMessage.get_ID().picture
	label.text = pMessage.get_contents()	

func _input(event):
	if event.is_action_pressed("Next"):
		_advance()
