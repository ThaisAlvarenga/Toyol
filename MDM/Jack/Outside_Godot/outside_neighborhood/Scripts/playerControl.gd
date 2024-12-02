extends CharacterBody2D

@export var speed: float = 200.0
@export var ifkey1: bool = false
@export var ifkey3: bool = false
@export var ifkey5: bool = false

var overlapping_door: Area2D = null
var gravity: float = 500.0 
var vertical_velocity: float = 0.0

func _ready():
	pass

func _process(delta):
	
	var direction = 0

	if Input.is_action_pressed("ui_left"):
		$AnimatedSprite2D.play("left")
		direction -= 1
	elif Input.is_action_pressed("ui_right"):
		$AnimatedSprite2D.play("right")
		direction += 1
	else: $AnimatedSprite2D.play("idle")
		
	vertical_velocity += gravity * delta

	velocity.x = direction * speed
	velocity.y = vertical_velocity
	move_and_slide()

	# Check for entering the door
	if Input.is_action_just_pressed("ui_up") and overlapping_door:
		enter_door()

func _on_door_area_entered(area):
	#if area.name == "DoorArea":
	if area.is_in_group("doors"):
		print("door!")
		overlapping_door = area

func _on_door_area_exited(area):
	if area == overlapping_door:
		overlapping_door = null

func enter_door():
	if overlapping_door:
		var door_id = overlapping_door.door_id
		match door_id:
			"Door1":
				trigger_event_door1()
			"Door2":
				trigger_event_door2()
			"Door3":
				trigger_event_door3()
			"Door4":
				trigger_event_door4()
			"Door5":
				trigger_event_door5()
			_:
				print("Unknown door entered: ", door_id)

func trigger_event_door1():
	if ifkey1:
		print("Entered Door 1 - Triggering Event 1")
	else:
		print("Door1 is locked")

func trigger_event_door2():
	print("The door is blocked from the inside")

func trigger_event_door3():
	if ifkey3:
		print("Entered Door 3 - Triggering Event 3")
	else:
		print("Door3 is locked")
	
func trigger_event_door4():
	print("Not Allowed to get in")
	
func trigger_event_door5():
	if ifkey5:
		print("Entered Door 5 - Triggering Event 5")
	else:
		print("Door5 is locked")
