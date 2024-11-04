extends Button

@onready var inventory = $"../Inventory"

func _ready():
	#on scene load, make sure inventory is close
	inventory.close()


func _on_pressed() -> void:
	# if inventory is showing
	if inventory.isOpen:
		#close/hide inventory
		inventory.close()
	
	# else show inventory
	else: inventory.open()
