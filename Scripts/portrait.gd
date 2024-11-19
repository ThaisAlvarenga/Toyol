extends Sprite2D

# Boolean to determine if sprite can stay at 0 rotation
# this variable is what we use to set the portrait to the right position
var can_stay_rotated = false 

# keeps track of whether sprite has been rotated
var is_rotated = true
var initial_rotation : float

# Duration of the animation rotation in seconds
var animation_duration = 0.5 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	initial_rotation = rotation


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _input(event: InputEvent) -> void:
	# if mouse button is cliekd
	if event.is_action_pressed("click"):
		# check the global position of the mouse
		var mouse_pos = get_global_mouse_position()
		# check that the mouse was clicked within the sprite
		# get_rect() checks with respect to the rect of the sprite
		if get_rect().has_point(to_local(mouse_pos)):
			# toggle open/close the sprite
			toggle_rotation()


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
	
