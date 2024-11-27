@tool
extends PopochiuProp
# You can use E.queue([]) to trigger a sequence of events.
# Use await E.queue([]) if you want to pause the excecution of
# the function until the sequence of events finishes.

var is_lit = false
var frame_time = 0.25  # Time in seconds for each frame
var timer = 0.0
var toggle = true

#region Virtual ####################################################################################
func _process(delta: float) -> void:
	animate(delta)


# When the node is clicked
func _on_click() -> void:
	# Replace the call to E.command_fallback() to implement your code.
	E.command_fallback()
	# For example, you can make the player character walk to this prop, gaze at it, and then say
	# something:
#	await C.player.walk_to_clicked()
#	await C.player.face_clicked()
#	await C.player.say("Not picking that up!")


func _on_double_click() -> void:
	# Replace the call to E.command_fallback() with your code.
	E.command_fallback()
	# For example, you could make the player instantly do something instead of walking there first


# When the node is right clicked
func _on_right_click() -> void:
	# Replace the call to E.command_fallback() to implement your code.
	E.command_fallback()
	# For example, you can make the player character gaze at this prop and then say something:
#	await C.player.face_clicked()
#	await C.player.say("A deck of cards")


# When the node is middle clicked
func _on_middle_click() -> void:
	# Replace the call to E.command_fallback() to implement your code.
	E.command_fallback()


# When the node is clicked and there is an inventory item selected
func _on_item_used(_item: PopochiuInventoryItem) -> void:
	# Replace the call to E.command_fallback() to implement your code.
	E.command_fallback()
	# For example, you can make the player character say something when the Key item is used in this
	# prop. Note that you have to change the name of the `_item` parameter to `item`.
#	if item == I.Key:
#		await C.player.say("I can't do that")


# When an inventory item linked to this Prop (link_to_item) is removed from
# the inventory (i.e. when it is used in something that makes use of the object).
func _on_linked_item_removed() -> void:
	pass


# When an inventory item linked to this Prop (link_to_item) is discarded from
# the inventory (i.e. when the player throws the object out of the inventory).
func _on_linked_item_discarded() -> void:
	pass


func animate(del:float):
	if is_lit:
		# Increment the timer by the delta time
		timer += del
		
		# Check if it's time to switch frames
		if timer >= frame_time:
			# Reset the timer
			timer = 0.0
			
			# Toggle between frames 1 and 2 using a boolean flag
			current_frame = 1 if toggle else 2
			toggle = !toggle
			#set_frame(current_frame)
			#print("Frame", current_frame)
		
	else:
		# Ensure the sprite is on frame 0 when not lit
		current_frame = 0
		#print("Frame: 0")

func set_frame(frame_index):
	# Set the sprite's frame property (assuming horizontal frames)
	current_frame = frame_index

func light_incense():
	# Start animating between frames 1 and 2
	is_lit = true

func extinguish_incense():
	# Stop animation and revert to frame 0
	is_lit = false
	
#endregion

#region Public #####################################################################################
# You can add here functions triggered by the GUI commands. For example, if your GUI has a command
# for look_at, you could have the function:
#func on_look_at() -> void:
	#pass


#endregion
