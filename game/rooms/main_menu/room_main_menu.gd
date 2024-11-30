@tool
extends PopochiuRoom

const Data := preload('room_main_menu_state.gd')

var state: Data = load("res://game/rooms/main_menu/room_main_menu.tres")


#region Virtual ####################################################################################
# What happens when Popochiu loads the room. At this point the room is in the
# tree but it is not visible
func _on_room_entered() -> void:
	G.gui.hide()


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


func _on_quit_btn_pressed() -> void:
	get_tree().quit()


func _on_start_btn_pressed() -> void:
	R.goto_room("3Altar")
