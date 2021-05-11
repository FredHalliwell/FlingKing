extends TouchScreenButton

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var reject_pressed
var reject_released

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TouchScreenButton_reject_pressed():
	reject_pressed = true
	reject_released = false


func _on_TouchScreenButton_reject_released():
	reject_pressed = false
	reject_released = true
