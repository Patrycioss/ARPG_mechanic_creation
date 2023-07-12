extends Node2D
class_name GameManager

var _player : Player = null
var _entities : Array = []
var _npcs : Array = []
var _interactables : Array = []
var _dialogueManager : DialogueManager = null
var _items : Array = []

func get_player():
	return _player

func get_entities():
	return _entities
	
func get_npcs():
	return _npcs
	
func get_interactables():
	return _interactables
	
func get_dialogue_manager():
	return _dialogueManager	
	
func get_items():
	return _items

func remove_item(item : Item):
	for i in range(_items.size()-1,-1,-1):
		if _items[i] == item:
			_items.remove_at(i)

func _on_child_entered_tree(node):
	
	if node is Entity:
		_entities.insert(_entities.size(), node)
		node.game_manager = self
	
		if node is Player:
			_player = node

		elif node is Interactable:
			_interactables.insert(_interactables.size(), node)

			if node is NPC:
				_npcs.insert(_npcs.size(),node)
	
	elif node is Item:
		_items.insert(_items.size(), node)
		node.game_manager = self
	
	elif node is DialogueManager:
		_dialogueManager = node
				


func _on_child_exiting_tree(node):
	if node is Entity:
		for i in range(_entities.size()-1,-1,-1):
			if _entities[i] == node:
				_entities.remove_at(i)
			
		if node is Player: _player = null
		elif node is Interactable:
			for i in range(_interactables.size()-1,-1,-1):
				if _interactables[i] == node:
					_interactables.remove_at(i)	
		
					if node is NPC:
						for n in range(_npcs.size()-1,-1,-1):
							if _npcs[n] == node:
								_npcs.remove_at(n)	
	
	elif node is Item:
		for item in range(_items.size()-1,-1,-1):
			if _items[item] == node:
				_items.remove_at(item)
	
	pass # Replace with function body.
