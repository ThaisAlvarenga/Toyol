extends AnimatedSprite2D

func _ready():
	add_to_group("chicks")

func react_to_collision():
	play("react")
	print("collided chick")
	
