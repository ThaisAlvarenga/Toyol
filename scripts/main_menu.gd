extends Node2D

# In this script the button presses connected
# are the ones in this same scene (Play button and Quit)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


# Play Button is Pressed
func _on_play_button_pressed() -> void:
	# Go to first house
	get_tree().change_scene_to_file("res://Scenes/1_house.tscn")
	
	
# Quit Button is Pressed
func _on_quit_button_pressed() -> void:
	# quit the game
	get_tree().quit()
