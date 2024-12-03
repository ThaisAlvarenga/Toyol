@tool
extends "res://addons/popochiu/engine/interfaces/i_inventory.gd"

# classes ----
const PIIDoorWood := preload("res://game/inventory_items/door_wood/inventory_item_door_wood.gd")
const PIIEmptyBowl := preload("res://game/inventory_items/empty_bowl/inventory_item_empty_bowl.gd")
const PIINail := preload("res://game/inventory_items/nail/inventory_item_nail.gd")
const PIIMatches := preload("res://game/inventory_items/matches/inventory_item_matches.gd")
const PIIBloodyBowl := preload("res://game/inventory_items/bloody_bowl/inventory_item_bloody_bowl.gd")
const PIIBrothBowl := preload("res://game/inventory_items/broth_bowl/inventory_item_broth_bowl.gd")
const PIIMeat := preload("res://game/inventory_items/meat/inventory_item_meat.gd")
const PIIPage := preload("res://game/inventory_items/page/inventory_item_page.gd")
const PIIKey5 := preload("res://game/inventory_items/key_5/inventory_item_key_5.gd")
# ---- classes

# nodes ----
var DoorWood: PIIDoorWood : get = get_DoorWood
var EmptyBowl: PIIEmptyBowl : get = get_EmptyBowl
var Nail: PIINail : get = get_Nail
var Matches: PIIMatches : get = get_Matches
var BloodyBowl: PIIBloodyBowl : get = get_BloodyBowl
var BrothBowl: PIIBrothBowl : get = get_BrothBowl
var Meat: PIIMeat : get = get_Meat
var Page: PIIPage : get = get_Page
var Key5: PIIKey5 : get = get_Key5
# ---- nodes

# functions ----
func get_DoorWood() -> PIIDoorWood: return get_item_instance("DoorWood")
func get_EmptyBowl() -> PIIEmptyBowl: return get_item_instance("EmptyBowl")
func get_Nail() -> PIINail: return get_item_instance("Nail")
func get_Matches() -> PIIMatches: return get_item_instance("Matches")
func get_BloodyBowl() -> PIIBloodyBowl: return get_item_instance("BloodyBowl")
func get_BrothBowl() -> PIIBrothBowl: return get_item_instance("BrothBowl")
func get_Meat() -> PIIMeat: return get_item_instance("Meat")
func get_Page() -> PIIPage: return get_item_instance("Page")
func get_Key5() -> PIIKey5: return get_item_instance("Key5")
# ---- functions
