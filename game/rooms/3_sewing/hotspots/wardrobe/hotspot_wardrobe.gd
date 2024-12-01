@tool
extends PopochiuHotspot
# You can use E.queue([]) to trigger a sequence of events.
# Use await E.queue([]) if you want to pause the excecution of
# the function until the sequence of events finishes.

@export var wardrobe_prop:PopochiuProp
var isOpen: bool = false

#region Virtual ####################################################################################
# When the node is clicked
func _on_click() -> void:
	A.sfx_closet_wardrobe.play()
	await get_tree().create_timer(.2).timeout
	isOpen = !isOpen
	toggle_open_close()


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
	# Replace the call to E.command_fallback() to implement your code.
	E.command_fallback()
	# For example, you can make the player character say something when the Key item is used in this
	# hotspot. Note that you have to change the name of the `_item` parameter to `item`.
#	if item == I.Key:
#		await C.player.say("No can do")

func toggle_open_close():
	if isOpen:
		wardrobe_prop.is_toyol = false
		wardrobe_prop.change_frame(3)
		
	else:
		wardrobe_prop.is_toyol = true
		#wardrobe_prop.change_frame(0)

#endregion

#region Public #####################################################################################
# You can add here functions triggered by the GUI commands. For example, if your GUI has a command
# for look_at, you could have the function:
#func on_look_at() -> void:
	#pass


#endregion
