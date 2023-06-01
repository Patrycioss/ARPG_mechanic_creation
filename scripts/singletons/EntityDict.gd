extends Node

var entities : Dictionary = {}

func get_entity(pName : String):
	print("now this")
	if entities.has(pName):
		print("Returned entity with name %s" %pName)
		return entities.get(pName)
	else:
		print("Could not find entity with name %s" %pName)
		return null
