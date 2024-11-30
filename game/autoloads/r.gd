@tool
extends "res://addons/popochiu/engine/interfaces/i_room.gd"

# classes ----
const PR3Altar := preload("res://game/rooms/3_altar/room_3_altar.gd")
const PR3Kitchen := preload("res://game/rooms/3_kitchen/room_3_kitchen.gd")
const PR3Entrance := preload("res://game/rooms/3_entrance/room_3_entrance.gd")
const PR3Sewing := preload("res://game/rooms/3_sewing/room_3_sewing.gd")
const PR3Bedroom := preload("res://game/rooms/3_bedroom/room_3_bedroom.gd")
const PR3Exit := preload("res://game/rooms/3_exit/room_3_exit.gd")
const PRNeighborhood := preload("res://game/rooms/neighborhood/room_neighborhood.gd")
# ---- classes

# nodes ----
var R3Altar: PR3Altar : get = get_3Altar
var R3Kitchen: PR3Kitchen : get = get_3Kitchen
var R3Entrance: PR3Entrance : get = get_3Entrance
var R3Sewing: PR3Sewing : get = get_3Sewing
var R3Bedroom: PR3Bedroom : get = get_3Bedroom
var R3Exit: PR3Exit : get = get_3Exit
var Neighborhood: PRNeighborhood : get = get_Neighborhood
# ---- nodes

# functions ----
func get_3Altar() -> PR3Altar: return get_runtime_room("3Altar")
func get_3Kitchen() -> PR3Kitchen: return get_runtime_room("3Kitchen")
func get_3Entrance() -> PR3Entrance: return get_runtime_room("3Entrance")
func get_3Sewing() -> PR3Sewing: return get_runtime_room("3Sewing")
func get_3Bedroom() -> PR3Bedroom: return get_runtime_room("3Bedroom")
func get_3Exit() -> PR3Exit: return get_runtime_room("3Exit")
func get_Neighborhood() -> PRNeighborhood: return get_runtime_room("Neighborhood")
# ---- functions

