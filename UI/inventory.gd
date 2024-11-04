extends Control

# In Godot, signals are messages that nodes emit 
# when something specific happens to them, 
# like a button being pressed. 
# Other nodes can connect to that signal and 
# call a function when the event occurs.

signal opened # signal that inventory was opened
signal closed # signal that inventory was closed

# checks if inventory UI is open/showing
var isOpen: bool = false

# if open, show inventory
func open():
	isOpen = true
	visible = true
	opened.emit()
	
	
# if close, hide inventory
func close():
	isOpen = false
	visible = false
	closed.emit()
	
