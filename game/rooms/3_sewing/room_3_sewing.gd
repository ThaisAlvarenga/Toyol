@tool
extends PopochiuRoom

const Data := preload('room_3_sewing_state.gd')

var state: Data = load("res://game/rooms/3_sewing/room_3_sewing.tres")


#region Virtual ####################################################################################
# What happens when Popochiu loads the room. At this point the room is in the
# tree but it is not visible
func _on_room_entered() -> void:
	print("\nSewing Room \n")
	if R.get_3Altar().state.completed:
		print("Altar room is completed")
		var wardrobe = R.get_prop('Wardrobe')
		wardrobe.is_toyol = false
	
	if R.get_3Altar().state.portrait_fixed:
		R.get_prop("Nail").hide()
		


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
