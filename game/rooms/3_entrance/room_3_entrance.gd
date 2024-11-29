@tool
extends PopochiuRoom

const Data := preload('room_3_entrance_state.gd')

var state: Data = load("res://game/rooms/3_entrance/room_3_entrance.tres")

#region Virtual ####################################################################################
func _process(delta: float) -> void:
	check_room_completion()

# What happens when Popochiu loads the room. At this point the room is in the
# tree but it is not visible
func _on_room_entered() -> void:
	load_room_state()
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
	

func load_room_state():
	var door = R.get_hotspot('Door')
	var window = R.get_hotspot('Window')
	
	door.is_closed = state.door_closed
	window.isClosed = state.window_closed
	
	door.update_visual()
	window.toggle_open_close()


func save_room_state():
	state.door_closed = R.get_hotspot('Door').is_closed
	state.window_closed = R.get_hotspot('Window').isClosed
	
	check_room_completion()


func check_room_completion():
	if state.door_closed and state.window_closed:
		state.completed = true
		print(self.script_name, "completed!")

# check look of room if it is complete
func change_room_look():
	# if room is complete (Note: add key check state)
	if state.completed:
		# get background
		var background = R.get_prop('Background')
		# set background to destroyed entrance
		background.current_frame = 0
		
		print("Entrance Completed")
		

func print_room_state():
	print("Room is", state.completed)
	print("Door closed:", state.door_closed)
	print("Window closed:", state.window_closed)


#endregion
