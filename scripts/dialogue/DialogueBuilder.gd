extends Node
class_name DialogueBuilder

@onready var entity_dict = get_node("/root/EntityDict")

func build_from_text_file(file_path : String):
	
	var file = FileAccess.open(file_path, FileAccess.READ)
	
	var new_dialogue : Dialogue = Dialogue.new()
	
	while !file.eof_reached():
		var line = file.get_line()
		var message = ""
		var reading_name = false		
		var found_name = ""
		for letter in line:
			if letter == '[':
				reading_name = true
			elif reading_name:
				if letter == ']':
					reading_name = false
				else:
					found_name = found_name + letter	
			else:
				message = message + letter
					
		if not found_name.is_empty():			
			var entity = entity_dict.get_entity(found_name)
			if entity == null:
				print("Found entity while building dialogue is null!")
			else:
				new_dialogue.add_message(Message.new(message, entity.get_ID()))
	
	new_dialogue.print_contents()
	return new_dialogue