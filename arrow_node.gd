extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var x_difference
var y_difference


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	#put arrow on mouse1 position
	#dont show arrow until player has increased power slightly, stops arrow spinning around own axis
	if $"/root/singleton".singleton_mouse1_pos != null:
		if get_global_mouse_position().x > $"/root/singleton".singleton_mouse1_pos.x + 15:
			position = $"/root/singleton".singleton_mouse1_pos
			visible = true
		elif get_global_mouse_position().x < $"/root/singleton".singleton_mouse1_pos.x -15:
			position = $"/root/singleton".singleton_mouse1_pos
			visible = true
		if get_global_mouse_position().y > $"/root/singleton".singleton_mouse1_pos.y + 15:
			position = $"/root/singleton".singleton_mouse1_pos
			visible = true
		elif get_global_mouse_position().y < $"/root/singleton".singleton_mouse1_pos.y -15:
			position = $"/root/singleton".singleton_mouse1_pos
			visible = true
	
	#point arrow where player aiming
	if $"/root/singleton".singleton_angle_to_aim != null:
		#have to add 90 degrees to it for it to be right. dont know why but thats ok it works
		rotation_degrees = $"/root/singleton".singleton_angle_to_aim + 90
		
	
	#make arrow invisible if player releases click
	
	#CHANGE THIS TO REMOVE ARROW FROM SCREEN AFTER PLAYER FIRES ON MOBILE
	if Input.is_action_just_released("left_click"):
		visible = false
		
		#resets mousepos1 after player fires
		$"/root/singleton".singleton_mouse1_pos = null
		
	
	
		
	#stretch arrow depending on fire power
	if $"/root/singleton".singleton_mouse1_pos != null:
		
		
		x_difference = $"/root/singleton".singleton_mouse1_pos.x - get_global_mouse_position().x
		y_difference = $"/root/singleton".singleton_mouse1_pos.y - get_global_mouse_position().y
		
		
		if abs(x_difference) > abs(y_difference):
			scale.y = abs(x_difference) / 35 + abs(y_difference) / 100
			
		if abs(x_difference) < abs(y_difference):
			scale.y = abs(y_difference) / 35 + abs(x_difference) / 100
		
		
