extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var player_touch

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$test_text.text = str(get_global_mouse_position())


func _on_Screen_press_button_mouse_entered():
	var player_touch = true
	
	$test_circle.visible = true


func _on_Screen_press_button_mouse_exited():
	var player_touch = false
	
	$test_circle.visible = false
