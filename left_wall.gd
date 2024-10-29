extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_left_arrow_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/back_wall.tscn")


func _on_right_arrow_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/front_wall.tscn")
