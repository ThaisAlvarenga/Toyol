@tool
extends PopochiuHotspot
# You can use E.queue([]) to trigger a sequence of events.
# Use await E.queue([]) if you want to pause the excecution of
# the function until the sequence of events finishes.

# import prop that displays sewing machine
@export var sewing_machine_prop:PopochiuProp
@export var nail:PopochiuProp

# tracks if sewing machine is struck
var isStuck: bool = true
# To track if we're currently animating
var is_sewing = false
# Frames per second for the animation
var animation_speed = 5


#region Virtual ####################################################################################

func _process(delta: float) -> void:
	animate()


# When the node is clicked
func _on_click() -> void:

	check_stuck()
	toggle_sewing()
	toggle_sound()
	# if stuck, only do stuck animation
	if isStuck:
		A.sfx_stuck_sewing.play()
		stuck_animation()


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


func check_stuck():
	if nail.on_sewing_machine:
		isStuck = true
	else:
		isStuck = false


func animate():
	if not isStuck and is_sewing:
		
		# Calculate the new frame based on time
		var new_frame = int(Time.get_ticks_msec() / (1000.0 / animation_speed)) % 2
		if sewing_machine_prop.current_frame != new_frame:
			#print('Frame',new_frame)
			sewing_machine_prop.change_frame(new_frame)
	
	else:
		# If we were animating but loop is now disabled, stop on current frame
		is_sewing = false


func toggle_sewing():
	is_sewing = !is_sewing
		
	print("sewing" if is_sewing && not isStuck else "sewing off")
	

func toggle_sound():
	
	if is_sewing and not isStuck :
		if not A.sfx_can_sew.is_playing():
			# play sewing sound
			A.sfx_can_sew.play(true)
			print("sewing sound ON")
		else:
			A.sfx_can_sew.stop()
			#reset to beginning
			#A.sfx_stovefire.queue_play(false)
			print("reseting sound")
			
	else: 
		A.sfx_can_sew.stop()
		print("sewing sound OFF")

func stuck_animation():
	if sewing_machine_prop.current_frame == 0:
		sewing_machine_prop.change_frame(1)
	elif sewing_machine_prop.current_frame == 1:
		sewing_machine_prop.change_frame(0)



#endregion

#region Public #####################################################################################
# You can add here functions triggered by the GUI commands. For example, if your GUI has a command
# for look_at, you could have the function:
#func on_look_at() -> void:
	#pass


#endregion
