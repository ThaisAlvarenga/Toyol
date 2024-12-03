@tool
extends PopochiuProp
# You can use E.queue([]) to trigger a sequence of events.
# Use await E.queue([]) if you want to pause the excecution of
# the function until the sequence of events finishes.
@export var book : PopochiuProp
@export var can_stay_rotated : bool = false 

# keeps track of whether sprite has been rotated
var is_rotated : bool = true
var initial_rotation : float


# Duration of the animation rotation in seconds
var animation_duration = 0.5


#region Virtual ####################################################################################
# When the node is clicked
func _on_click() -> void:
	initial_rotation = rotation
	toggle_rotation()
	if not can_stay_rotated:
		A.sfx_portrait.play()


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
	if _item == I.Nail:
		A.sfx_screw.play()
		set_can_stay_rotated(true)
		animation_duration = 1.5
		toggle_rotation()
		I.Nail.remove()
	else: E.command_fallback()
	
	if _item == I.Screwdriver:
		I.Screwdriver.remove()
		hide()
		book.show()
	
	get_tree().current_scene.check_room_completion()



# When an inventory item linked to this Prop (link_to_item) is removed from
# the inventory (i.e. when it is used in something that makes use of the object).
func _on_linked_item_removed() -> void:
	pass


# When an inventory item linked to this Prop (link_to_item) is discarded from
# the inventory (i.e. when the player throws the object out of the inventory).
func _on_linked_item_discarded() -> void:
	pass


func toggle_rotation():
	# if the portait is rotated
	if is_rotated:
		# Animate to 0 rotation
		create_tween().tween_property(self, "rotation", 0, animation_duration).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC)
		is_rotated = false
		
		# If it can't stay rotated, schedule return to initial rotation
		if not can_stay_rotated:
			get_tree().create_timer(animation_duration).timeout.connect(return_to_initial_rotation)
	# else reset rotation
	else:
		return_to_initial_rotation()
		
	
	print("Animating rotation to: ", "0" if not is_rotated else "initial")



func return_to_initial_rotation() -> void:
	# if you can not stay rotated
	if not is_rotated and not can_stay_rotated:
		# go back to original rotation
		create_tween().tween_property(self, "rotation", initial_rotation, animation_duration).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC)
		# set is rotated to true
		is_rotated = true


# Function to set whether the sprite can stay at 0 rotation
func set_can_stay_rotated(value: bool) -> void:
	# state that it can stay rotated
	can_stay_rotated = value
	
	# if it can not state rotated then reset position
	if not can_stay_rotated and not is_rotated:
		# trigger animation to return to intial rotation
		return_to_initial_rotation()
	
	# ---- CHANGE FRAME TO 1
	else: change_frame(1)
	
func update_visual():
	if can_stay_rotated and !is_rotated:
		rotation = 0
	
		
		

#endregion

#region Public #####################################################################################
# You can add here functions triggered by the GUI commands. For example, if your GUI has a command
# for look_at, you could have the function:
#func on_look_at() -> void:
	#pass


#endregion
