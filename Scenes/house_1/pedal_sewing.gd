extends Sprite2D

@export var loop_enabled = false  # The bool to control behavior
var is_animating = false  # To track if we're currently animating
var animation_speed = 5  # Frames per second for the animation

func _ready():
	# Ensure we start on the first frame
	frame = 0

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed and get_rect().has_point(to_local(event.position)):
			if loop_enabled:
				# Start or stop the animation
				is_animating = not is_animating
			else:
				# Just move to the next frame
				frame = (frame + 1) % 2

func _process(delta):
	if loop_enabled and is_animating:
		# Calculate the new frame based on time
		var new_frame = int(Time.get_ticks_msec() / (1000.0 / animation_speed)) % 2
		if frame != new_frame:
			frame = new_frame
	elif not loop_enabled and is_animating:
		# If we were animating but loop is now disabled, stop on current frame
		is_animating = false
