@tool
extends PopochiuHotspot
# You can use E.queue([]) to trigger a sequence of events.
# Use await E.queue([]) if you want to pause the excecution of
# the function until the sequence of events finishes.

@export var bedside_table : PopochiuProp
@export var inside_object_1: PopochiuProp
@export var inside_object_2: PopochiuProp

var isOpen : bool = false

#region Virtual ####################################################################################
# When the node is clicked
func _on_click() -> void:
	# Replace the call to E.command_fallback() with your code.
	toggleOpen()
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
	# Replace the call to E.command_fallback() to implement your code.
	E.command_fallback()
	# For example, you can make the player character say something when the Key item is used in this
	# hotspot. Note that you have to change the name of the `_item` parameter to `item`.
#	if item == I.Key:
#		await C.player.say("No can do")


func toggleOpen():
	isOpen = !isOpen
	
	# if drawer is open
	if isOpen:
		# change to open frame
		bedside_table.change_frame(1)
		show_object(inside_object_1)
		show_object(inside_object_2)
	
	# if drawer is closed
	else: 
		# change to closed frame
		bedside_table.change_frame(0)
		# hide object 1 inside drawer
		hide_object(inside_object_1)
		hide_object(inside_object_2)

func show_object(object : PopochiuProp):
	#if item 1 inside drawer is in invetory
	if I.is_item_in_inventory(object.name):
		#print(object.name," found")
		# hide object
		object.hide()
		print(object.name," is in inventory")
	#else if item has not been collected, show
	else: object.show()
	
	if R.get_3Kitchen().state.page_burned:
		hide_object(inside_object_2)
		print("page burned can't show")
		
func hide_object(object : PopochiuProp):
	object.hide()
	

#endregion

#region Public #####################################################################################
# You can add here functions triggered by the GUI commands. For example, if your GUI has a command
# for look_at, you could have the function:
#func on_look_at() -> void:
	#pass


#endregion
