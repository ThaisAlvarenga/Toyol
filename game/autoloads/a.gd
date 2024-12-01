@tool
extends "res://addons/popochiu/engine/interfaces/i_audio.gd"

# cues ----
var sfx_nail_pickup: AudioCueSound = load("res://game/rooms/3_sewing/props/nail/sfx_nail_pickUp.tres")
var sfx_meat_pickup: AudioCueSound = load("res://game/rooms/3_kitchen/props/meat/sfx_meat_pickUp.tres")
var sfx_stovefire: AudioCueSound = load("res://game/rooms/3_kitchen/hotspots/stove/sfx_stoveFire.tres")
var sfx_broth_pickup: AudioCueSound = load("res://game/rooms/3_kitchen/props/broth_bowl/sfx_broth_pickUp.tres")
var sfx_key_pickup: AudioCueSound = load("res://game/rooms/3_kitchen/props/key_house_5/sfx_key_pickUp.tres")
var sfx_wood_pickup: AudioCueSound = load("res://game/rooms/3_entrance/props/wood/sfx_wood_pickUp.tres")
var sfx_window: AudioCueSound = load("res://game/rooms/3_entrance/hotspots/window/sfx_window.tres")
var sfx_doorlocked: AudioCueSound = load("res://game/rooms/3_entrance/hotspots/door/sfx_doorLocked.tres")
var sfx_nightstand_open: AudioCueSound = load("res://game/rooms/3_bedroom/hotspots/bedside_drawer_1/sfx_nightstand_open.tres")
var sfx_page_pickup: AudioCueSound = load("res://game/rooms/3_bedroom/props/page/sfx_page_pickUp.tres")
var sfx_bloodybowl_pickup: AudioCueSound = load("res://game/rooms/3_bedroom/props/bloody_bowl/sfx_bloodybowl_pickUp.tres")
var sfx_set_bowl_down: AudioCueSound = load("res://game/rooms/3_bedroom/hotspots/set_bowl/sfx_set_bowl_down.tres")
var sfx_match: AudioCueSound = load("res://game/inventory_items/matches/sfx_match.tres")
var sfx_toy_pelletdrum: AudioCueSound = load("res://game/rooms/3_altar/props/toy/sfx_Toy_pelletDrum.tres")
var sfx_screw: AudioCueSound = load("res://game/rooms/3_altar/props/portrait/sfx_screw.tres")
var sfx_emptybowl_pickup: AudioCueSound = load("res://game/rooms/3_altar/props/empty_bowl/sfx_emptybowl_pickUp.tres")
var sfx_set_brothbowl: AudioCueSound = load("res://game/rooms/3_altar/hotspots/set_bowl/sfx_set_brothbowl.tres")
var sfx_closet_wardrobe: AudioCueSound = load("res://game/rooms/3_sewing/props/wardrobe/sfx_closet_wardrobe.tres")
var sfx_stuck_sewing: AudioCueSound = load("res://game/rooms/3_sewing/hotspots/sewing_machine/sfx_stuck_sewing.tres")
var sfx_can_sew: AudioCueSound = load("res://game/rooms/3_sewing/hotspots/sewing_machine/sfx_can_sew.tres")
var sfx_drop_on_liquid: AudioCueSound = load("res://game/rooms/3_kitchen/hotspots/pot/sfx_drop_on_liquid.tres")
var sfx_knockingdoor: AudioCueSound = load("res://game/rooms/3_entrance/hotspots/door/sfx_knockingDoor.tres")
var click: AudioCueSound = load("res://game/gui/click.tres")
var keypress: AudioCueSound = load("res://game/gui/keypress.tres")
var sfx_pickup: AudioCueSound = load("res://game/rooms/3_kitchen/props/meat/sfx_pickUp.tres")
var sfx_portrait: AudioCueSound = load("res://game/rooms/3_altar/props/portrait/sfx_portrait.tres")
# ---- cues
