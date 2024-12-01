@tool
extends PopochiuHotspot
# You can use E.queue([]) to trigger a sequence of events.
# Use await E.queue([]) if you want to pause the excecution of
# the function until the sequence of events finishes.

var bloody_bowl_set:bool = false

#region Virtual ####################################################################################
# When the node is clicked
func _on_click() -> void:
	# Replace the call to E.command_fallback() with your code.
	E.command_fallback()
	# For example, you can make the player character walk to this hotspot, gaze at it, and then say
	# something:
#	await C.player.walk_to_clicked()
#	await C.player.face_clicked()
#	await C.player.say("What a nice view")


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
	if _item == I.EmptyBowl:
		A.sfx_set_bowl_down.play()
		I.EmptyBowl.remove()
		# show bloody bowl
		var bloodybowl = R.get_prop("BloodyBowl")
		bloody_bowl_set = true
		bloodybowl.show()
		print("empty bowl set")
		


func update_visual():
	var bloodybowl = R.get_prop("BloodyBowl")
	if bloody_bowl_set and !R.get_3Kitchen().state.broth_bowl_made:
		bloodybowl.show()
		print("show bloody bowl")
		
	elif bloody_bowl_set and R.get_3Kitchen().state.broth_bowl_made:
		print("broth made with blood")
		bloodybowl.hide()
		
	if I.is_item_in_inventory("BloodyBowl"):
		bloodybowl.hide()
		

#endregion

#region Public #####################################################################################
# You can add here functions triggered by the GUI commands. For example, if your GUI has a command
# for look_at, you could have the function:
#func on_look_at() -> void:
	#pass


#endregion
