extends Sprite2D

#signal door_state_changed(is_closed: bool)

var dragging = false
var drag_offset = Vector2.ZERO
var door_is_closed = false  # New variable to track if the wood is snapped

@export var door: StaticBody2D
@export var snap_marker: Marker2D

@onready var area = $Area2D

func _ready():
	set_process_input(true)
	if not door or not snap_marker:
		push_warning("Door or Snap Marker not set for " + name)
	if not area:
		push_warning("Area2D child not found for " + name)
	print("Wood ready. Door:", door, "Snap Marker:", snap_marker)

func _input(event):
	if door_is_closed:  # If snapped, ignore all input
		return
	
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			if get_rect().has_point(to_local(event.global_position)):
				dragging = true
				drag_offset = global_position - event.global_position
		else:
			dragging = false
			print("Checking collision with door")
			check_collision_with_door()

func _process(delta):
	if dragging and not door_is_closed:
		global_position = get_global_mouse_position() + drag_offset
		# print("Dragging wood. Position:", global_position)

func check_collision_with_door():
	if door and snap_marker and area:
		var overlapping_bodies = area.get_overlapping_bodies()
		print("Wood: Overlapping bodies:", overlapping_bodies)
		if door in overlapping_bodies:
			global_position = snap_marker.global_position
			door_is_closed = true
			#print("Wood: Emitting door_state_changed signal")
			#emit_signal("door_state_changed", true)
			print("Wood snapped to marker position and locked")
		else:
			print("No collision with door")
