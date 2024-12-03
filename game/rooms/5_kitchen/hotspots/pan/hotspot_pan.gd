@tool
extends PopochiuHotspot
# You can use E.queue([]) to trigger a sequence of events.
# Use await E.queue([]) if you want to pause the excecution of
# the function until the sequence of events finishes.
@export var stove : PopochiuHotspot

@export var rotten_meat : PopochiuProp
@export var broth_bowl_prop : PopochiuProp

@export var Pan1 : PopochiuProp
@export var Pan2 : PopochiuProp

var pan_set : bool = false
var meat_added = false
var blood_added = false
var broth_bowl_made: bool = false

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
	if _item == I.Pan:
		I.Pan.remove()
		pan_set = true
		Pan1.hide()
		Pan2.show()

	if pan_set and stove.stove_on:
		
		if _item == I.RottenMeat:
			A.sfx_drop_on_liquid.play()
			I.RottenMeat.remove()
			meat_added = true
			checkBrothState()
	
		elif _item == I.BloodBag:
			A.sfx_drop_on_liquid.play()
			I.BloodBag.remove()
			blood_added = true
			checkBrothState()
			
		

func checkBrothState():
	if meat_added && blood_added && stove.stove_on && !I.BrothBowl.in_inventory:
		broth_bowl_made = true
		if !broth_bowl_prop.visible:
			update_visual()

func update_visual():
	if pan_set:
		Pan1.hide()
		Pan2.show()
	elif I.is_item_in_inventory("Pan"):
		Pan1.hide()
		Pan2.hide()
	
	if meat_added:
		rotten_meat.hide()
	
	if broth_bowl_made:
		
		if I.is_item_in_inventory("BrothBowl"):
			broth_bowl_prop.hide()
		else: broth_bowl_prop.show()
		
	

#endregion

#region Public #####################################################################################
# You can add here functions triggered by the GUI commands. For example, if your GUI has a command
# for look_at, you could have the function:
#func on_look_at() -> void:
	#pass


#endregion
