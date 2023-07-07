extends Node2D
class_name GameManager

var _entities : Array = []
var _npcs : Array = []
var _interactables : Array = []

func get_entities():
	return _entities
	
func get_npcs():
	return _npcs
	
func get_interactables():
	return _interactables

func _on_child_entered_tree(node):
	if node is Entity:
		_entities.insert(_entities.size(), node)
		node.game_manager = self
		
	if node is NPC:
		_npcs.insert(_npcs.size(),node)
	
	if node is Interactable:
		_interactables.insert(_interactables.size(), node)
