class_name InventorySlot
extends PanelContainer

signal item_dropped_outside(item: InventoryItem)


@export var type : ItemData.Type


func _init(t: ItemData.Type, cms: Vector2) -> void:
	type = t
	custom_minimum_size = cms
	

func _can_drop_data(at_position: Vector2, data: Variant):
	if data is InventoryItem:
		if type == ItemData.Type.MAIN:
			if get_child_count() ==0:
				return true
			else:
				if type == data.get_parent().type:
					return true
			return get_child(0).data.type == data.data.type
		else:
			return data.data.type == type
	# if everything fails, then we are not dragging a slot
	return false

func _drop_data(at_position: Vector2, data: Variant) -> void:
	
	if get_child_count() > 0:
		var item := get_child(0) # get first item
		# if it is the same item, return
		if item == data:
			return
		item.reparent(data.get_parent())
	data.reparent(self)
