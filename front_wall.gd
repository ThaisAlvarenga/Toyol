extends Node2D

@onready var inventory_ui = %Inventory
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(inventory_ui) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_left_arrow_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/left_wall.tscn")




func _on_right_arrow_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/right_wall.tscn")
