extends Sprite2D

# holds furniture where item can go into
# this furniture will also influence item visibility
@export var parent_furniture : OpenCloseFurniture

# can drag (mouse)
var is_dragging = false
# offset of the drag
var drag_offset = Vector2.ZERO
# tracks if visibility of item is dependent on furniture being opened/closed
var is_independent = false


func _ready() -> void:
	# if there is no parent, give a message
	if parent_furniture == null:
		push_error("parent_furniture is not set for " + name)
		return
	
	# connect to parent signal (toggled)
	parent_furniture.toggled.connect(_on_parent_furniture_toggled)
	# update visibility of the item based on the parent furniture
	update_visibility()


# when  parent is toggled, update the visibility
func _on_parent_furniture_toggled(is_open: bool) -> void:
	update_visibility()


# on mouse click
func _input(event: InputEvent) -> void:
	# ignore input if the item is not visible
	# because you can't interact with it
	if not visible:
		return

	# Note: this mouse input handling is necessary to be able to stop moving the 
	# item with the mouse. It is what will allow us to toggle the furniture
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		# get mouse position
		var mouse_pos = get_global_mouse_position()
		# if mouse is pressed
		if event.pressed:
			# start dragging if the mouse is over the sprite
			if get_rect().has_point(to_local(mouse_pos)):
				is_dragging = true
				drag_offset = position - mouse_pos
				# prevent the furniture from toggling while dragging
				parent_furniture.set_can_toggle(false)
				# prevent the event from propagating further
				get_viewport().set_input_as_handled()
		
		# stop dragging when mouse is released
		else:
			# if we are already dragging
			if is_dragging:
				is_dragging = false
				# allow the furniture to toggle (open/close)
				parent_furniture.set_can_toggle(true)
				# check if sprite is independent from furniture (outside 
				check_independence()
			get_viewport().set_input_as_handled()
			
	# if we are still dragging the mouse
	elif event is InputEventMouseMotion and is_dragging:
		# set the position of the item to the mouse position
		position = get_global_mouse_position() + drag_offset
		get_viewport().set_input_as_handled()


# check if the sprite is inside or outside the furniture area
func check_independence() -> void:
	var item_rect = get_global_rect()
	var furniture_rect = parent_furniture.get_global_rect()
	
	# sprite is independent if they don't intersect with the furniture
	var was_independent = is_independent
	is_independent = not item_rect.intersects(furniture_rect)
	
	# if the independence state changed, update visibility and log the change
	if is_independent != was_independent:
		print("Matches are now " + ("independent" if is_independent else "dependent"))
		update_visibility()


# get the global rectangle of the sprite
func get_global_rect() -> Rect2:
	var rect = get_rect()
	return Rect2(to_global(rect.position), rect.size * global_scale)


# update the visibility of the sprite based on their state and the furniture state
func update_visibility() -> void:
	# The sprite is visible if they're independent 
	# or if the furniture is open
	visible = is_independent or parent_furniture.is_open
