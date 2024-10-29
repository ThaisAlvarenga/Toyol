extends CanvasLayer

# variable for size of inventory
var InventorySize = 8 
var itemsLoad = [
	"res://Items/egg.tres",
	"res://Items/little_house.tres"
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in InventorySize:
		var slot := InventorySlot.new(ItemData.Type.MAIN, Vector2(120,120))
		%Inventory.add_child(slot)
		
		
	for i in itemsLoad.size():
		print(i)
		var loaded_resource = load(itemsLoad[i])
		print(loaded_resource)
		if loaded_resource is ItemData:
			var item := InventoryItem.new(loaded_resource)
			%Inventory.get_child(i).add_child(item)
		else:
			print("Error: Loaded resource is not an ItemData: ", itemsLoad[i])
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		self.visible = !self.visible
