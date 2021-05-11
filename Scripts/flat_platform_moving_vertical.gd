extends StaticBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var speed = 1
var colliding_with = "top"

var above_vertical_platform



# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#bug: if player was on moving_platform, then goes to vertical_platform, preview will spam update.

		
		
	
	
	if colliding_with != null:
		
		if "top" in colliding_with:
			position.y += speed
			
			
			constant_linear_velocity.y = 75
			
			$"/root/singleton".singleton_vertical_platform_direction = colliding_with
			
			
		elif "bottom" in colliding_with:
			position.y -= speed
			
			
			constant_linear_velocity.y = -25
			
				
			
			
			$"/root/singleton".singleton_vertical_platform_direction = colliding_with

	
	
func _on_Area2D_colliding_with_area_entered(area):
	
	constant_linear_velocity.y = 0
	#stops colliding_with becoming whatever player is on, such as flat_platform
	if not "above" in area.get_name() and not "bottom_of" in area.get_name():
		colliding_with = area.get_name()
		
		
		


