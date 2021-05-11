extends RigidBody2D

# Declare member variables here. Examples:
var mouse_position_1
var mouse_position_2

var preview_mouse_position

var shoot_angle

var velocity

var colliding_with
var on_vertical_platform = false

var old_position_frame
var position_frame_timer = 0
var angle_between_positions

var development_controls = true # change to false to activate mobile controls for export

var mouse_difference 

#check for when to launch the ball
#################################
var x_difference
var y_difference

const preview_instance = preload("res://Player_preview.tscn")

#trajectory vars
####################

var singleton_trajectory1_position
var singleton_trajectory2_position
var singleton_trajectory3_position
var singleton_trajectory4_position
var singleton_trajectory5_position
var singleton_trajectory6_position

var rotating_platform_corner_collision = "none"

var abs_player_velocity

var current_checkpoint
var current_checkpoint_position

var create_checkpoint_message_instance

var ruler_pitch




# Called when the node enters the scene tree for the first time.
func _ready():
	
	add_collision_exception_with($Area2D_bottom_of_player)
	add_collision_exception_with($Area2D_bottom_of_player/CollisionShape2D)
	
	#$"/root/singleton".singleton_player_object = self

# Called every frame. 'delta' is the elapsed time since the previous frame.

#Check for screen touch
func _input(event):
	pass

func _process(delta):
	
	#flip animation depending on shoot angle
	#flip shadow too
	if $"/root/singleton".singleton_shoot_direction != null:
		if $"/root/singleton".singleton_shoot_direction.x > 0:
			$knight.flip_h = false
			$lightblock.scale.x = 1
		else:
			$knight.flip_h = true
			$lightblock.scale.x = -1
	
	
	
	#align singleton to current checkpoint position
	$"/root/singleton".singleton_current_checkpoint_position = current_checkpoint_position
	
	#absolute value of player velocity
	$"/root/singleton".abs_player_velocity = abs(linear_velocity.x) + abs(linear_velocity.y)
	
	$"/root/singleton".singleton_player_velocity = linear_velocity

	
	#set position of trajectories based on preview ball path
	if $"/root/singleton".singleton_trajectory1_position != null:
		$trajectory_1.position = $"/root/singleton".singleton_trajectory1_position
	if $"/root/singleton".singleton_trajectory2_position != null:
		$trajectory_2.position = $"/root/singleton".singleton_trajectory2_position
	if $"/root/singleton".singleton_trajectory3_position != null:
		$trajectory_3.position = $"/root/singleton".singleton_trajectory3_position
	if $"/root/singleton".singleton_trajectory4_position != null:
		$trajectory_4.position = $"/root/singleton".singleton_trajectory4_position
	if $"/root/singleton".singleton_trajectory5_position != null:
		$trajectory_5.position = $"/root/singleton".singleton_trajectory5_position
	if $"/root/singleton".singleton_trajectory6_position != null:
		$trajectory_6.position = $"/root/singleton".singleton_trajectory6_position
		
	

	
	#pass variables to singleton for preview ball
	if mouse_position_1 != null:
		$"/root/singleton".player_mouse_position_1 = mouse_position_1
	if mouse_position_2 != null:
		$"/root/singleton".player_mouse_position_2 = mouse_position_2
	if shoot_angle != null:
		$"/root/singleton".player_shoot_angle = shoot_angle


	
	
	
	
	if development_controls == true:
		
		#shoot player
		#get mouse click position, get click release position, click position - click release position gets angle for shot
		
		if $"/root/singleton".screenpress == true: #as long as player is on a flat platform
			#define mouse_position_1 as current click location, same as with preview_mouse_position
			mouse_position_1 = get_global_mouse_position()
			
			
			
			preview_mouse_position = get_global_mouse_position()
			
			#pass mouse_position-1 to singleton
			$"/root/singleton".singleton_mouse1_pos = mouse_position_1
			
			#display trajectory dots once player clicks
				
				
				

		
				
		if colliding_with != null and "flat_platform" in colliding_with or $"/root/singleton".singleton_player_on_vertical_platform == true: 	
			#CHECK FOR WHEN TO LAUNCH THE BALL, AKA EVERY 5 FRAME DIFFERENCE IN MOUSE MOVEMENT
####################################################################################################
			
			#check x difference between click and current mouse, check y difference between click and current mouse
			if preview_mouse_position != null:
				x_difference = preview_mouse_position.x - get_global_mouse_position().x
				y_difference = preview_mouse_position.y - get_global_mouse_position().y
			
			#if the difference between X or Y is more than 5 pixels, adjust aim trajectory
			if preview_mouse_position != null:
				#checks if mouse moves one pixel, or checks if player is on moving platform, in which case update trajectory on change
				if abs(x_difference) > 1 or abs(y_difference) > 1 or "right" in $"/root/singleton".moving_platform_direction or "left" in $"/root/singleton".moving_platform_direction or "top" in $"/root/singleton".singleton_vertical_platform_direction or "bottom" in $"/root/singleton".singleton_vertical_platform_direction:
					if $"/root/singleton".screenpressheld == true:
						
						#start timer for preview trajectory
						
						
						
						
						
						#launch ball
						$"/root/singleton".singleton_launch_preview_ball = true
						
						preview_mouse_position = get_global_mouse_position()
						
						$"/root/singleton".singleton_create_preview_instance = true
						#create ball_preview_instance
						
						
						
						
						
						
						if $"/root/singleton".singleton_create_preview_instance == true:
							#add instance of preview
							add_child(preview_instance.instance())
							preview_instance.instance().position = $"/root/singleton".singleton_player_pos
							
							
							
							$trajectory_1.visible = true
							$trajectory_2.visible = true
							$trajectory_3.visible = true
							$trajectory_4.visible = true
							$trajectory_5.visible = true
							$trajectory_6.visible = true
							
							#update preview instance number
								
				#stop instance creation after launch
				else:
					$"/root/singleton".singleton_create_preview_instance = false
					
					
				#####################################################################################################
				
		
		if colliding_with != null or $"/root/singleton".singleton_player_on_vertical_platform == true:
			if $"/root/singleton".screenrelease == true and mouse_position_1 != Vector2(0,0): #as long as player is on flat platform
				if colliding_with != null or $"/root/singleton".singleton_player_on_vertical_platform == true:
				
					#hide trajectory dots once shot is taken
					$trajectory_1.visible = false
					$trajectory_2.visible = false
					$trajectory_3.visible = false
					$trajectory_4.visible = false
					$trajectory_5.visible = false
					$trajectory_6.visible = false
					
					
					
					
					
					
			
				
					
					#get distance between mouse1 position and current mouse position, aka the power of the shot
					mouse_position_2 = get_global_mouse_position()
					
					$"/root/singleton".singleton_mouse2_pos = mouse_position_2
					
					#get angle to shoot player
					shoot_angle = mouse_position_1 - mouse_position_2
					$"/root/singleton".singleton_shoot_direction = shoot_angle
					
					
					
					#apply impulse to player
					#TODO: only apply impulse if abs(shootangle.x or .y ) < 350
					
					#if shot power is below 350 on each angle, shoot shot as normal
					if abs(shoot_angle.x) < 350 and abs(shoot_angle.y) < 350:
						#check if player is on a none-moving platform, if so shoot ball
						
						if $"/root/singleton".singleton_player_colliding_with != null or $"/root/singleton".singleton_player_on_vertical_platform == true:
							if $"/root/singleton".singleton_player_colliding_with != null and not "moving" in $"/root/singleton".singleton_player_colliding_with:
								apply_impulse(shoot_angle*5, shoot_angle*5)
								#if player is on left moving platform, apply velocity of moving platform to it + default
							elif $"/root/singleton".singleton_player_colliding_with != null and "left" in $"/root/singleton".moving_platform_direction:
								apply_impulse(shoot_angle*5, shoot_angle*5 + Vector2(120,0))
								
								#if player is on right moving platform, apply velocity of moving platform to it + default
							elif $"/root/singleton".singleton_player_colliding_with != null and "right" in $"/root/singleton".moving_platform_direction:
								apply_impulse(shoot_angle*5, shoot_angle*5 + Vector2(-120,0))
							
							elif "bottom" in $"/root/singleton".singleton_vertical_platform_direction:
								apply_impulse(shoot_angle*5, shoot_angle*5 + Vector2(0,25))
								
							elif "top" in $"/root/singleton".singleton_vertical_platform_direction:
								apply_impulse(shoot_angle*5, shoot_angle*5 + Vector2(0,-75))
						
				
					else:
						#if shot power is beyond maximum, limit it to maximum and shoot
						if shoot_angle.x > 349:
							shoot_angle.x = 350
						if shoot_angle.x < -349:
							shoot_angle.x = -350
						
						if shoot_angle.y > 349:
							shoot_angle.y = 350
						if shoot_angle.y < -349:
							shoot_angle.y = -350
							
						
						apply_impulse(shoot_angle*5, shoot_angle*5)
						
						
						#play ruler sound fx
						#$ruler_fx.pitch_scale = shoot_angle.x +shoot_angle.y / 200
					
					#set ruler pitch based on shot power
					if abs(shoot_angle.x) > abs(shoot_angle.y):
						ruler_pitch = abs(shoot_angle.x)
					else:
						ruler_pitch = abs(shoot_angle.y)
						
					ruler_pitch = ruler_pitch / 250
					
					#randomises pitch between a range if shot power is too low
					#or else sound is really deep and like a horror film
					if ruler_pitch > 0.9:
						$ruler_fx.pitch_scale = ruler_pitch
					else:
						$ruler_fx.pitch_scale = rand_range(0.8,1.2)
					$ruler_fx.play()
					
					
					
					
				#set mouse_position_1 to 0, or so player cannot shoot again with previous shot's aim when landing
				#mouse_position_1 = Vector2(0,0)
				
		else:
			#if colliding with IS null
			$"/root/singleton".singleton_trajectory1_position = Vector2(-10000,-10000)
			$"/root/singleton".singleton_trajectory2_position = Vector2(-10000,-10000)
			$"/root/singleton".singleton_trajectory3_position = Vector2(-10000,-10000)
			$"/root/singleton".singleton_trajectory4_position = Vector2(-10000,-10000)
			$"/root/singleton".singleton_trajectory5_position = Vector2(-10000,-10000)
			$"/root/singleton".singleton_trajectory6_position = Vector2(-10000,-10000)
	
		
	
	#if player is on a flat platform, and lateral velocity is above one, enable cube collider to stop it rolling
	#if lateral velocity is below one, disable cube collider
	if colliding_with != null:
		if "flat_platform" in colliding_with:
			if abs(linear_velocity.x) >1:
				$roll_stopper_collision.disabled = true #this originalyl was false. dont think its needed anymore but can change back if becomes glitchy
			elif abs(linear_velocity.x) <1:
				$roll_stopper_collision.disabled = true
	
	
	#POINT BALL IN DIRECTION IT IS FLINGING
	#check difference between ball position every 5 frames
	position_frame_timer += 1
	if position_frame_timer == 5:
		old_position_frame = position
		position_frame_timer = 0
		
	#get angle between current position, and position 5 frames ago
	if old_position_frame != null:
		$"/root/singleton".angle_between_positions = rad2deg(get_angle_to(old_position_frame))
	
	#pass current position to singleton, so player preview can spawn on it
	#OPTIMISATION, THIS CHECKS EVERY FRAME BUT ISNT NECESSARY. ONLY NEEDS TO BE CHECKED WHEN PLAYER IS STATIONARY AND AIMING.
	$"/root/singleton".singleton_player_pos = global_position
	
	
	
	#check if player is bellow current checkpoint
	#if player has reached a checkpoint
	if current_checkpoint_position != null:
		#if player is bellow current checkpoint by 25 pixels
		if position.y > current_checkpoint_position.y + 25:
			#if player is not moving, ish
			if abs(linear_velocity.x) < 0.1 and abs(linear_velocity.y) < 0.1:
				#create messsage if message does not already exist
				if $"/root/singleton".create_checkpoint_message_instance != false:
					$"/root/singleton".create_checkpoint_message_instance = true
			
			#check if player is on moving platform, which doesnt give them 0 velocity
			elif colliding_with != null and "moving" in colliding_with:
				if $"/root/singleton".create_checkpoint_message_instance != false:
					$"/root/singleton".create_checkpoint_message_instance = true
				
					
	
					
	
	#check if player goes above checkpoint after rejecting reset message
	#if player is above current checkpoint position
	if current_checkpoint_position != null:
		if position.y < current_checkpoint_position.y + 25:
			#if player is not moving
			if linear_velocity == Vector2(0,0):
				#reset checkpoint message to once again check if player falls bellow it
				$"/root/singleton".create_checkpoint_message_instance = null
		
				
				
	#what the fuck does this mean. COMMENT UR CODE FRED
	if $"/root/singleton".play_interstital_singleton == true:
		position = current_checkpoint_position
		
		
	

	
#check what type of object the ball is colliding with, store name in var colliding_with
func _on_player_rigidbody_body_entered(body):
	
		
	
	
	colliding_with = (body.get_name())
	
	print(colliding_with)
	
	
	
	
	$"/root/singleton".singleton_player_colliding_with = (body.get_name())
	
	#set friction to slidey if player collides with slidey platform
	if "slidey" in body.get_name():
		friction = 0.25
	if "rotating" in body.get_name():
		friction = 0.25
		
		
		
		
		
	
		
	

#check if ball no longer colliding with body
func _on_player_rigidbody_body_exited(body):
	
	#as long as player is not in corner of rotating platform, colliding_with can become null
	if rotating_platform_corner_collision != "Area2D_not_null_collision":
		colliding_with = null
		
		$"/root/singleton".singleton_player_colliding_with = null
		
		#reset friction to default
		friction = 1
		
	
		



func _on_Area2D_bottom_of_player_body_entered(body):
	
	if "vertical" in body.get_name():
		$"/root/singleton".singleton_player_on_vertical_platform = true
		
		

		
	
		
		


func _on_Area2D_bottom_of_player_body_exited(body):
	if "vertical" in body.get_name():
		$"/root/singleton".singleton_player_on_vertical_platform = false



#check for colliding with rotating platform, to stop glitchy collision
#check for player colliding with checkpoint areas
func _on_Area2D_bottom_of_player_area_entered(area):
	rotating_platform_corner_collision = area.get_name()
	
	
	#assign current checkpoint to player
	#if player has not reached a checkpoint, assign first checkpoint they reach to current_checkpoint
	if current_checkpoint == null:
		if "checkpoint" in area.get_name():
			current_checkpoint = area.get_name()
			
			#assign current_checkpoint_position
			current_checkpoint_position = area.position
	
	#hide checkpoint reminder if player returns to that checkpoint manually
	if current_checkpoint != null and area.get_name() == current_checkpoint:
		if $"/root/singleton".checkpoint_reminder_object_singleton != null:
			$"/root/singleton".checkpoint_reminder_object_singleton.queue_free()
			
	else:
		#if player collides with higher number checkpoint than current checkpoint
		if "checkpoint" in area.get_name():
			if area.get_name().to_int() > current_checkpoint.to_int():
				#update current_checkpoint
				current_checkpoint = area.get_name()
				
				
				
				
				
				#assign current_checkpoint_position
				current_checkpoint_position = area.position
	
			
	
	







	

#check of exit colliding platform collision
func _on_Area2D_bottom_of_player_area_exited(area):
	rotating_platform_corner_collision = "none"
	#checks if player is on rotating platform 
	if "not_null" in area.get_name():
		colliding_with = null
	
	
	
	
