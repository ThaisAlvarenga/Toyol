@tool
extends PopochiuRoom

const Data := preload('room_3_altar_state.gd')

var state: Data = load("res://game/rooms/3_altar/room_3_altar.tres")

func _process(delta: float) -> void:
	check_room_completion()

#region Virtual ####################################################################################
# What happens when Popochiu loads the room. At this point the room is in the
# tree but it is not visible
func _on_room_entered() -> void:
	load_room_state()
	print_room_state()
	check_room_completion()
	



# What happens when the room changing transition finishes. At this point the room
# is visible.
func _on_room_transition_finished() -> void:
	# You can use await E.queue([]) to excecute a sequence of instructions
	pass


# What happens before Popochiu unloads the room.
# At this point, the screen is black, processing is disabled and all characters
# have been removed from the $Characters node.
func _on_room_exited() -> void:
	check_room_completion()
	save_room_state()

func load_room_state():
	## get props
	
	#var toy = R.get_prop('Toy')
	var portrait = R.get_prop('Portrait')
	var empty_bowl = R.get_prop("EmptyBowl")
	var toy = R.get_prop("Toy")
	
	## get hotspots
	var incense = R.get_hotspot("Incense")
	var broth_bowl_set = R.get_hotspot('SetBowl')
	

	## load states from room state
	portrait.is_rotated = not state.portrait_fixed
	portrait.can_stay_rotated = state.portrait_stay_rotated
	incense.lighted = state.incense_lighted
	empty_bowl.used = state.empty_bowl_used
	broth_bowl_set.placed = state.broth_bowl_set
	toy.toy_played = state.toy_played
	
	
	## update visuals
	empty_bowl.update_visual()
	portrait.update_visual()
	incense.update_visual()
	broth_bowl_set.update_visual()
	


func save_room_state():
	state.portrait_fixed = not R.get_prop('Portrait').is_rotated
	state.portrait_stay_rotated = R.get_prop('Portrait').can_stay_rotated
	state.empty_bowl_used = R.get_prop('EmptyBowl').used
	state.toy_played = R.get_prop("Toy").toy_played
	state.incense_lighted = R.get_hotspot("Incense").lighted
	state.broth_bowl_set = R.get_hotspot('SetBowl').placed
	
	check_room_completion()

func check_room_completion():
	if state.portrait_fixed and state.incense_lighted and state.broth_bowl_set and state.toy_played:
		state.completed = true
		#C.Player.state.altar_5_completed = true
		print("\n",self.script_name, "completed!")
		#print(C.name, ": ",C.player.altar_5_completed )
		

func set_room_completed(_state : bool):
	state.completed = _state

func print_room_state():
	print("\nALTAR ROOM \n")
	print("Room is complete: ", state.completed)
	print("Portrait is", state.portrait_fixed)
	print("Portrait stay rot ", state.portrait_stay_rotated)
	print("EmptyBowl is", state.empty_bowl_used)
	print("Incense is",state.incense_lighted )
	print("Broth bowl is", state.broth_bowl_set)
	print("Toy played is", state.toy_played)

#endregion
