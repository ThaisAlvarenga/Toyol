extends Node

class_name Inventory


var items = []

func add_item(item):
	items.append(item)

func remove_item(item):
	if item in items:
		items.erase(item)

func get_items():
	return items
