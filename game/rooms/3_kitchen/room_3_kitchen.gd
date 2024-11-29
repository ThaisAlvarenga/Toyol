@tool
extends PopochiuRoom

const Data := preload('room_3_kitchen_state.gd')

var state: Data = load("res://game/rooms/3_kitchen/room_3_kitchen.tres")


#region Virtual ####################################################################################
# What happens when Popochiu loads the room. At this point the room is in the
# tree but it is not visible
func _on_room_entered() -> void:
	load_room_state()
	check_room_completion()
	print_room_state()


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
	
func save_room_state():
	state.stove_on = get_hotspot('Stove').stove_on
	check_room_completion()

func load_room_state():
	get_hotspot('Stove').stove_on = state.stove_on
	
	get_hotspot('Stove').update_visual()
	

func check_room_completion():
	if state.page_burned:
		state.completed = true
		print(self.script_name, " completed")

func print_room_state():
	print("\n 3 Kitchen \n")
	print(self.script_name, ": ", state.completed)
	print("Stove on is ", state.stove_on)
	print("Page was burned ", state.page_burned)
	
#endregion
