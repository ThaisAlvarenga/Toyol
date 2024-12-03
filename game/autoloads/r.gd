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
const PRMainMenu := preload("res://game/rooms/main_menu/room_main_menu.gd")
const PR5Altar := preload("res://game/rooms/5_altar/room_5_altar.gd")
const PR5Entrance := preload("res://game/rooms/5_entrance/room_5_entrance.gd")
const PR5Bedroom := preload("res://game/rooms/5_bedroom/room_5_bedroom.gd")
const PR5Kitchen := preload("res://game/rooms/5_kitchen/room_5_kitchen.gd")
const PR5Sewing := preload("res://game/rooms/5_sewing/room_5_sewing.gd")
const PR1Altar := preload("res://game/rooms/1_altar/room_1_altar.gd")
const PR1Bedroom := preload("res://game/rooms/1_bedroom/room_1_bedroom.gd")
const PR1Entrance := preload("res://game/rooms/1_entrance/room_1_entrance.gd")
const PR1Kitchen := preload("res://game/rooms/1_kitchen/room_1_kitchen.gd")
const PR1Sewing := preload("res://game/rooms/1_sewing/room_1_sewing.gd")
const PRCutscene1 := preload("res://game/rooms/cutscene_1/room_cutscene_1.gd")
# ---- classes

# nodes ----
var R3Altar: PR3Altar : get = get_3Altar
var R3Kitchen: PR3Kitchen : get = get_3Kitchen
var R3Entrance: PR3Entrance : get = get_3Entrance
var R3Sewing: PR3Sewing : get = get_3Sewing
var R3Bedroom: PR3Bedroom : get = get_3Bedroom
var R3Exit: PR3Exit : get = get_3Exit
var Neighborhood: PRNeighborhood : get = get_Neighborhood
var MainMenu: PRMainMenu : get = get_MainMenu
var R5Altar: PR5Altar : get = get_5Altar
var R5Entrance: PR5Entrance : get = get_5Entrance
var R5Bedroom: PR5Bedroom : get = get_5Bedroom
var R5Kitchen: PR5Kitchen : get = get_5Kitchen
var R5Sewing: PR5Sewing : get = get_5Sewing
var R1Altar: PR1Altar : get = get_1Altar
var R1Bedroom: PR1Bedroom : get = get_1Bedroom
var R1Entrance: PR1Entrance : get = get_1Entrance
var R1Kitchen: PR1Kitchen : get = get_1Kitchen
var R1Sewing: PR1Sewing : get = get_1Sewing
var Cutscene1: PRCutscene1 : get = get_Cutscene1
# ---- nodes

# functions ----
func get_3Altar() -> PR3Altar: return get_runtime_room("3Altar")
func get_3Kitchen() -> PR3Kitchen: return get_runtime_room("3Kitchen")
func get_3Entrance() -> PR3Entrance: return get_runtime_room("3Entrance")
func get_3Sewing() -> PR3Sewing: return get_runtime_room("3Sewing")
func get_3Bedroom() -> PR3Bedroom: return get_runtime_room("3Bedroom")
func get_3Exit() -> PR3Exit: return get_runtime_room("3Exit")
func get_Neighborhood() -> PRNeighborhood: return get_runtime_room("Neighborhood")
func get_MainMenu() -> PRMainMenu: return get_runtime_room("MainMenu")
func get_5Altar() -> PR5Altar: return get_runtime_room("5Altar")
func get_5Entrance() -> PR5Entrance: return get_runtime_room("5Entrance")
func get_5Bedroom() -> PR5Bedroom: return get_runtime_room("5Bedroom")
func get_5Kitchen() -> PR5Kitchen: return get_runtime_room("5Kitchen")
func get_5Sewing() -> PR5Sewing: return get_runtime_room("5Sewing")
func get_1Altar() -> PR1Altar: return get_runtime_room("1Altar")
func get_1Bedroom() -> PR1Bedroom: return get_runtime_room("1Bedroom")
func get_1Entrance() -> PR1Entrance: return get_runtime_room("1Entrance")
func get_1Kitchen() -> PR1Kitchen: return get_runtime_room("1Kitchen")
func get_1Sewing() -> PR1Sewing: return get_runtime_room("1Sewing")
func get_Cutscene1() -> PRCutscene1: return get_runtime_room("Cutscene1")
# ---- functions

