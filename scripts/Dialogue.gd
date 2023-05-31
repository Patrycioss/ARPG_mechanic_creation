extends Node
class_name Dialogue

var index : int = 0
@export var messages : Array

func print_contents():
	for n in messages:
		print(n)

func message_available():
	if index < messages.size() && index > -1:
		return true
	else:
		return false	
	
func next_message():
	var message = messages[index]
	index += 1
	return message

func add_message(pMessage : String):
	print("Inserting %s" %pMessage)
	messages.insert(messages.size(), pMessage)

static func make_from_text_file(file_path : String):
	var file = FileAccess.open(file_path, FileAccess.READ)
	
	var content = file.get_as_text()
	var new_dialogue = Dialogue.new()
	
	var message = ""
	
	for letter in content:
		print(letter)
		message = message + letter
		if letter == '?' || letter == '!':
			new_dialogue.add_message(message)
			message = ""
			
	new_dialogue.add_message(message)
	new_dialogue.print_contents()
	return new_dialogue
