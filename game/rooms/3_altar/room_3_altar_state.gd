extends PopochiuRoomData
# Put here variables you want to save and load when saving and loading the game.
# By default only Godot's basic built-in types are automatically saved and loaded
# but you can use the save_custom and load_custom methods to implement your
# own.
# script_name and scene variables from the inherited class will not be saved.
var completed : bool = false

var portrait_fixed : bool = false
var portrait_stay_rotated : bool = false
var incense_lighted : bool = false
var empty_bowl_used : bool = false
var broth_bowl_set : bool = false

#region Virtual ####################################################################################
# Use this to save custom data for this PopochiuRoom when saving the game.
# The Dictionary must contain only JSON supported types: bool, int, float, String.


func _on_save() -> Dictionary:
	return {}


# Called when the game is loaded.
# This Dictionary should has the same structure you defined for the returned
# one in on_save().
func _on_load(data: Dictionary) -> void:
	prints(data)


#endregion