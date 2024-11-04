extends CanvasLayer

@onready var inventory = $"../Control/Inventory"

func _ready() -> void:
	#on scene load, make sure inventory is close
	inventory.close()


func buttonPressed():
	# if inventory is showing
	if inventory.isOpen:
		#close/hide inventory
		inventory.close()
	
	# else show inventory
	else: inventory.open()
