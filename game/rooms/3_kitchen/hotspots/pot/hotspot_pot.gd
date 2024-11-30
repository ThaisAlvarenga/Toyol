@tool
extends PopochiuHotspot
# You can use E.queue([]) to trigger a sequence of events.
# Use await E.queue([]) if you want to pause the excecution of
# the function until the sequence of events finishes.
@export var stove : PopochiuHotspot
@export var broth_bowl_prop : PopochiuProp
@export var meat : PopochiuProp

var meat_added = false
var blood_added = false
var broth_bowl_made: bool = false

func _process(delta: float) -> void:
	pass
	#checkBrothState()

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
	if stove.stove_on:
		if _item == I.Meat:
			I.Meat.remove()
			meat_added = true
			checkBrothState()
	
		elif _item == I.BloodyBowl:
			I.BloodyBowl.remove()
			blood_added = true
			checkBrothState()
		
	else: E.command_fallback()

func checkBrothState():
	if meat_added && blood_added && stove.stove_on && !I.BrothBowl.in_inventory:
		broth_bowl_made = true
		if !broth_bowl_prop.visible:
			update_visual()

func update_visual():
	if broth_bowl_made and !R.get_3Altar().state.broth_bowl_set:
		broth_bowl_prop.show()
		meat.hide()
	
	elif broth_bowl_made and R.get_3Altar().state.broth_bowl_set:
		broth_bowl_prop.hide()
		meat.hide()
	
	if meat_added:
		meat.hide()

#endregion

#region Public #####################################################################################
# You can add here functions triggered by the GUI commands. For example, if your GUI has a command
# for look_at, you could have the function:
#func on_look_at() -> void:
	#pass


#endregion
