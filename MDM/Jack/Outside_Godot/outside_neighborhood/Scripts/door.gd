extends Area2D
@export var door_id: String = ""

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))
	connect("body_exited", Callable(self, "_on_body_exited"))

func _on_body_entered(body):
	if body is CharacterBody2D: # Adjust based on your character node type
		body._on_door_area_entered(self)

func _on_body_exited(body):
	if body is CharacterBody2D:
		body._on_door_area_exited(self)
