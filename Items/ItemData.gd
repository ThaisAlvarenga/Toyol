class_name ItemData # create a class called item
extends Resource

enum Type { FOOD, MAIN}
# for example { FOOD, DOCUMENT, CHEST, MAIN}

@export var type : Type 
@export var name : String
@export_multiline var description : String
@export var texture : Texture2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
