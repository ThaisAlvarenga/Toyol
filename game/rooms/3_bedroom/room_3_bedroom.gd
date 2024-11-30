@tool
extends PopochiuRoom

const Data := preload('room_3_bedroom_state.gd')

var state: Data = load("res://game/rooms/3_bedroom/room_3_bedroom.tres")


#region Virtual ####################################################################################
# What happens when Popochiu loads the room. At this point the room is in the
# tree but it is not visible
func _on_room_entered() -> void:
	load_room_state()


# What happens when the room changing transition finishes. At this point the room
# is visible.
func _on_room_transition_finished() -> void:
	# You can use await E.queue([]) to excecute a sequence of instructions
	pass


# What happens before Popochiu unloads the room.
# At this point, the screen is black, processing is disabled and all characters
# have been removed from the $Characters node.
func _on_room_exited() -> void:
	save_room_state()
	
	



func load_room_state():
	
	## get hotspots
	var blood_bowl = R.get_hotspot('SetBowl')

	## load states from room state
	blood_bowl.bloody_bowl_set = state.bloody_bowl_active
	
	## update visuals
	blood_bowl.update_visual()
	
	


func save_room_state():
	state.bloody_bowl_active = R.get_hotspot('SetBowl').bloody_bowl_set
	
	


func print_room_state():
	print("\nBED ROOM \n")
	print("Blood bowl active: ", state.bloody_bowl_active)


#endregion
