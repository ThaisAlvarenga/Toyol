extends PopochiuCharacterData


# script_name and scene variables from the inherited class will not be saved.
var unlocked_house_5 : bool = false
var unlocked_house_1 : bool = false

#region Virtual ####################################################################################
# Use this to save custom data for this PopochiuCharacter when saving the game.
# The Dictionary must contain only JSON supported types: bool, int, float, String.
func _on_save() -> Dictionary:
	return {}


# Called when the game is loaded.
# This Dictionary should has the same structure you defined for the returned
# one in on_save().
func _on_load(data: Dictionary) -> void:
	prints(data)


#endregion
