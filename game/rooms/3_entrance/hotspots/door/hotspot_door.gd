@tool
extends PopochiuHotspot
# You can use E.queue([]) to trigger a sequence of events.
# Use await E.queue([]) if you want to pause the excecution of
# the function until the sequence of events finishes.
var is_closed = false

#region Virtual ####################################################################################
# When the node is clicked
func _on_click() -> void:
	# open door
	E.command_fallback()


func _on_double_click() -> void:
	# Replace the call to E.command_fallback() with your code.
	E.command_fallback()
	# For example, you could make the player instantly goto another room on an exit hotspot instead
	# of waiting for the player to walk there.
#	await R.current = R.NewRoom


# When the node is right clicked
func _on_right_click() -> void:
	# Replace the call to E.command_fallback() with your code.
	E.command_fallback()
	# For example, you can make the player character gaze at this hotspot and then say something:
#	await C.player.face_clicked()
#	await C.player.say("A window")


# When the node is middle clicked
func _on_middle_click() -> void:
	# Replace the call to E.command_fallback() to implement your code.
	E.command_fallback()


# When the node is clicked and there is an inventory item selected
func _on_item_used(_item: PopochiuInventoryItem) -> void:
	# Check if object interacted with is correct item
	if _item == I.DoorWood:
		A.sfx_doorlocked.play()
		# remove item from inventory
		I.DoorWood.remove()
		# assign variable to room prop
		var wood = R.get_prop('Wood')
		
		wood.close_door()
		
		update_visual()

func update_visual():
	if is_closed:
		var wood = R.get_prop('Wood')
		#var door = R.get_prop('Door')
		#print("Wood + Door")
		# show prop
		if !wood.visible:
			wood.show()
			
		#wood.close_door()
		
		# snap to position
		wood.snap_position()
	

#endregion

#region Public #####################################################################################
# You can add here functions triggered by the GUI commands. For example, if your GUI has a command
# for look_at, you could have the function:
#func on_look_at() -> void:
	#pass


#endregion
