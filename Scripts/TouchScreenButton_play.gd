extends TouchScreenButton

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var play_pressed
var play_released

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TouchScreenButton_play_pressed():
	play_pressed = true
	play_released= false


func _on_TouchScreenButton_play_released():
	play_pressed = false
	play_released = true
