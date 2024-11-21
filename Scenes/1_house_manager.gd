class_name HouseManager
extends Node2D

@export var player_manager: PlayerManager

var rooms_path = [
	"res://Scenes/house_1/1_0_house.tscn",
	"res://Scenes/house_1/1_1_house.tscn",
	"res://Scenes/house_1/1_2_house.tscn",
	"res://Scenes/house_1/1_3_house.tscn", 
	"res://Scenes/house_1/1_4_house.tscn"
]

# keeps track of the current room
var current_room_index : int = 0 
# node where we will load room scene as a child of House Manager
var current_room : Node

func _ready() -> void:
	# load initial scene room 0, (current_room_index = 0)
	load_scene(current_room_index)
	# message to show that we are currently in house 1
	print("House 1 Manager")

func _process(delta: float) -> void:
	pass

func load_scene(index: int) -> void:
	# if index is out of bounds 
	if index < 0 or index >= rooms_path.size():
		print("Invalid scene index")
		return
	
	# Remove the current room if it exists
	if current_room:
		remove_child(current_room)
		current_room.queue_free()
	
	# Load and instance the new room
	var room_scene = load(rooms_path[index])
	current_room = room_scene.instantiate()
	# add room as child of House Manager
	add_child(current_room)
	
	# Connect signals from the 1st room
	#if current_room.has_signal("door_state_changed"):
		#current_room.connect("door_state_changed", _on_door_state_changed)
		#print("HouseManager: Door signal connected")
	#if current_room.has_signal("window_state_changed"):
		#current_room.connect("window_state_changed", _on_window_state_changed)
		#print("HouseManager: Window signal connected")
	#
	
	# update current room index
	current_room_index = index
	print("Loaded scene: " , index)


# load scene that proceeds current scene
func next_scene() -> void:
	load_scene((current_room_index + 1) % rooms_path.size())
	

# loads previous scene
func previous_scene() -> void:
	load_scene((current_room_index - 1 + rooms_path.size()) % rooms_path.size())

# accesses any scene given an index
func go_to_scene(index: int) -> void:
	load_scene(index)

#
#func _on_door_state_changed(is_closed: bool):
	#print("HouseManager: Door state changed to ", is_closed)
	#if player_manager:
		#player_manager.update_door_state(is_closed)
	#else:
		#print("HouseManager: player_manager is null")
#
#func _on_window_state_changed(is_closed: bool):
	#print("HouseManager: Window state changed to ", is_closed)
	#if player_manager:
		#player_manager.update_window_state(is_closed)
	#else:
		#print("HouseManager: player_manager is null")
