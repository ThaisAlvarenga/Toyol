extends Sprite2D

var mousePos = null
var selected = false

# Add this line to get the collision shape
@onready var collision_shape = $CollisionShape2D


func _ready() -> void:
	# Enable collision detection
	collision_shape.set_deferred("disabled", false)


func _process(delta: float) -> void:
	if selected:
		pass
		mousePos = get_global_mouse_position()
		position = mousePos
		
		# Check for collision
		check_collision()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		# Check if the click is within the bounds of this sprite
		if get_rect().has_point(to_local(event.global_position)):
			selected = !selected
			#inventory.visible = !inventory.visible
			#print("toggle inventory")
	
	

func check_collision():
	var space_state = get_world_2d().direct_space_state
	var query = PhysicsShapeQueryParameters2D.new()
	query.set_shape(collision_shape.shape)
	query.transform = global_transform
	
	var result = space_state.intersect_shape(query)
	
	for collision in result:
		var collider = collision["collider"]
		if collider.is_in_group("chicks"):
			print("Collided with chick!")
			# You can trigger the chick's reaction here
			collider.react_to_collision()
