extends Entity
class_name NPC

@export var dialogue_manager : DialogueManager

@export_file var dialogue_path

@export var messages : Array

@onready var dialogue_builder : DialogueBuilder = $DialogueBuilder
@onready var interact_indicator = $Interact

var _dialogue : Dialogue

var _dialogue_built = false

func _ready():
	interact_indicator.visible = false
	super._ready()
	on_hit.connect(_on_hit)
	var dialogue_box = get_node("../DialogueBox")
	dialogue_box.connect_npc(self)
	
func interact():
	print("yes")
	dialogue_manager.play_dialogue(_dialogue)	

func on_in_range():
	interact_indicator.visible = true

func on_out_of_range():
	interact_indicator.visible = false		

#func _process(_delta):
#	if Input.is_action_pressed("interact"):
#		dialogue_manager.play_dialogue(_dialogue)

func _physics_process(_delta):
	if not _dialogue_built:
		_dialogue = dialogue_builder.build_from_text_file(dialogue_path)
		_dialogue.print_contents()
		_dialogue_built = true

func _on_hit():
	pass


