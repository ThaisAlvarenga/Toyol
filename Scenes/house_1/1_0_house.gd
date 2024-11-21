extends Node2D

signal door_state_changed(is_closed: bool)
signal window_state_changed(is_closed: bool)

func _ready():
	pass
	#$Wood.connect("door_state_changed", _on_door_state_changed)
	#$Window.connect("window_state_changed", _on_window_state_changed)
	#print("1_0_house: Signals connected")

func _on_door_state_changed(is_closed: bool):
	pass
	#print("1_0_house: Door state changed to ", is_closed)
	#emit_signal("door_state_changed", is_closed)

func _on_window_state_changed(is_closed: bool):
	pass
	#print("1_0_house: Window state changed to ", is_closed)
	#emit_signal("window_state_changed", is_closed)
