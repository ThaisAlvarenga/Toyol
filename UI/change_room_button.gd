extends TextureButton

@export var house_manager : HouseManager

@export var load_next_room : bool = true;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_pressed() -> void:
	if  load_next_room:
		house_manager.next_scene()
	else: house_manager.previous_scene()
