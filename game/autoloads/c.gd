@tool
extends "res://addons/popochiu/engine/interfaces/i_character.gd"

# classes ----
const PCPlayer := preload("res://game/characters/player/character_player.gd")
const PCToyol := preload("res://game/characters/toyol/character_toyol.gd")
# ---- classes

# nodes ----
var Player: PCPlayer : get = get_Player
var Toyol: PCToyol : get = get_Toyol
# ---- nodes

# functions ----
func get_Player() -> PCPlayer: return get_runtime_character("Player")
func get_Toyol() -> PCToyol: return get_runtime_character("Toyol")
# ---- functions

