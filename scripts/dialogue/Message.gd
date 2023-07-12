class_name Message

var _contents : String
var _id : ID

func _init(contents : String, id : ID):
	_contents = contents
	_id = id
#	print("Made message with contents: %s sent by %s" %contents %id.name)
	pass

func get_contents():
	return _contents
	
func get_ID():
	return _id
