extends TextureButton

@export var scene_path : String;
var next_scene: PackedScene  # Declare my_scene without initializing it


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if scene_path != "":
		next_scene = load(scene_path)  # Use load() instead of preload()
		if next_scene:
			print("Scene loaded successfully.")
		else:
			print("Error: Could not load the scene at path:", scene_path)
	else:
		print("Error: scene_path is empty.")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	



func _on_pressed() -> void:
	if next_scene:
		get_tree().change_scene_to_packed(next_scene)
	else:
		print("Error: next_scene is not loaded.")
