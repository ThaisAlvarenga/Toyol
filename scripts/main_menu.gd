extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.main_scene = self
	


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/front_wall.tscn")


func _on_something_else_pressed() -> void:
	print("Button working")



func _on_quit_pressed() -> void:
	get_tree().quit()
