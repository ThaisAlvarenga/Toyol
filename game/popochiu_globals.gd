extends Node

var house_5 = false
var house_1 = false

func _process(delta: float) -> void:
	check_house3_completion()


func check_house3_completion():
	if R.get_3Altar().state.completed and R.get_3Entrance().state.completed and R.get_3Kitchen().state.completed:
		house_5 = true
		print("House 3 IS COMPLETE")
