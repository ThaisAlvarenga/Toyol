extends Sprite2D
class_name OpenCloseFurniture

#signal window_state_changed(is_closed: bool)

# NOTES:
# in this context, open means that the sprite has two frames:
# 		in one the sprite is open
# 		in the other frame, the sprite is closed
# when I say to open the sprite, it means to set its frame to show
# that it is open

signal toggled(is_open: bool)

# keeps track of whether sprite is in open or closed frame
var is_open = false 
# keeps track of whether the furniture can toggle to open/close
var can_toggle = true


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# set current frame of drawing to 0 for idle
	self.frame = 0


func _input(event: InputEvent) -> void:
	# if mouse button is clicked
	if can_toggle and event.is_action_pressed("click"):
		# check the global position of the mouse
		var mouse_pos = get_global_mouse_position()
		# check that the mouse was clicked within the sprite
		# get_rect() checks with respect to the rect of the sprite
		if get_rect().has_point(to_local(mouse_pos)):
			# toggle open/close the sprite
			toggle_open()


func toggle_open() -> void:
	# set tracker to opposite
	is_open = !is_open
	# frame is 1 if closet is open, else frame is 0 (closed)
	self.frame = 1 if is_open else 0
	# print that closet is either open or closed
	print("Furniture is now " + ("open" if is_open else "closed"))
	print("Window: Emitting window_state_changed signal")
	# Emit a signal when toggled
	emit_signal("toggled", is_open)
	#emit_signal("window_state_changed", not is_open)


# function to change whether or not toggling is permissible
func set_can_toggle(value: bool) -> void:
	can_toggle = value


# calculated the global rect
func get_global_rect() -> Rect2:
	var rect = get_rect()
	return Rect2(to_global(rect.position), rect.size * global_scale)
