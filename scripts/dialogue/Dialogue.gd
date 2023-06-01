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

func add_message(pMessage : Message):
	print("Inserting %s" %pMessage)
	messages.insert(messages.size(), pMessage)


