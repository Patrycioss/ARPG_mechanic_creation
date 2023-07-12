extends Node

var entities : Dictionary = {}

func get_entity(pName : String):
	if entities.has(pName):
		return entities.get(pName)
	else:
		print("Could not find entity with name %s" %pName)
		return null
