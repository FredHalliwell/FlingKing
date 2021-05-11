extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var angle_to_aim

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	position = get_global_mouse_position()
	
	#get angle from mouse1 to mouse2 position, which is angle for arrow to aim at
	if $"/root/singleton".singleton_mouse1_pos != null:
		angle_to_aim = rad2deg(get_angle_to($"/root/singleton".singleton_mouse1_pos))
		
		$"/root/singleton".singleton_angle_to_aim = angle_to_aim
	
