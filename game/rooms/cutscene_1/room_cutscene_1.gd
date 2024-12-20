@tool
extends PopochiuRoom

const Data := preload('room_cutscene_1_state.gd')

var state: Data = load("res://game/rooms/cutscene_1/room_cutscene_1.tres")


#region Virtual ####################################################################################
# What happens when Popochiu loads the room. At this point the room is in the
# tree but it is not visible
func _on_room_entered() -> void:
	pass


# What happens when the room changing transition finishes. At this point the room
# is visible.
func _on_room_transition_finished() -> void:
	# You can use await E.queue([]) to excecute a sequence of instructions
	pass


# What happens before Popochiu unloads the room.
# At this point, the screen is black, processing is disabled and all characters
# have been removed from the $Characters node.
func _on_room_exited() -> void:
	pass


#endregion


func _on_start_btn_pressed() -> void:
	R.goto_room("MainMenu")


func _on_start_btn_2_pressed() -> void:
	R.goto_room("Neighborhood")
