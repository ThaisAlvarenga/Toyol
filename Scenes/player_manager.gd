extends Node
class_name PlayerManager

signal room_secured

var door_closed = false
var window_closed = false

var inventory = Inventory.new()


@onready var room_nav_ui = $"../CanvasLayer/Room Nav"

func _ready():
	add_child(inventory)
	#room_nav_ui.hide()

func update_door_state(is_closed: bool):
	print("PlayerManager: Updating door state to ", is_closed)
	door_closed = is_closed
	check_room_security()

func update_window_state(is_closed: bool):
	print("PlayerManager: Updating window state to ", is_closed)
	window_closed = is_closed
	check_room_security()

func check_room_security():
	print("PlayerManager: Checking room security. Door: ", door_closed, ", Window: ", window_closed)
	#if door_closed and window_closed:
		#room_nav_ui.show()
		#print("PlayerManager: Room secured, showing UI")
		#emit_signal("room_secured")
	#else:
		#room_nav_ui.hide()
		#print("PlayerManager: Room not secured, hiding UI")
