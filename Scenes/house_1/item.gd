extends Node2D


signal item_clicked(item)

@onready var sprite = $Sprite2D
@onready var area = $Area2D

func _ready():
	area.input_event.connect(_on_input_event)

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		emit_signal("item_clicked", self)

# You can add methods to get/set the item's properties
func get_item_name():
	return name

func get_item_texture():
	return sprite.texture
