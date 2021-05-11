extends StaticBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#speed of moving platform
var speed = 2 # speed of platform movement
#check if player body is colliding with platform
var player_colliding_with 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $travel_direction_area.move_left == true:
		position.x -= speed
		if $"/root/singleton".singleton_player_colliding_with != null:
			constant_linear_velocity.x = -120
		
	elif $travel_direction_area.move_right == true:
		position.x += speed
		if $"/root/singleton".singleton_player_colliding_with != null:
			constant_linear_velocity.x = 120
		
		
	if player_colliding_with != null:
		if "player" in player_colliding_with and $travel_direction_area.move_left == true:
			$"/root/singleton".moving_platform_direction = "left"
			
	
		elif "player" in player_colliding_with and $travel_direction_area.move_right == true:
			$"/root/singleton".moving_platform_direction = "right"
			
	else:
		$"/root/singleton".moving_platform_direction = "none"
			
			
	
	

#HAVING AN OFFET STATICBODY2_BLOCKER (COLLISION WHICH THE PLAYER SITS ON) WORKS FOR SOME REASON TO STOP INFINITE FALL GLITCH. DUNNO WHY AT ALL

func _on_travel_direction_area_body_entered(body):
	player_colliding_with = body.get_name()
	
	
	


func _on_travel_direction_area_body_exited(body):
	player_colliding_with = null
	
	
	
	
