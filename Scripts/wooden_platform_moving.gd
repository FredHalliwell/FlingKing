extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

#moves platform before it collides with areas. henceforth its movement is decided by areas
var default_move

# Called when the node enters the scene tree for the first time.
func _ready():
	default_move = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if default_move == true:
		$KinematicBody2D.position.x +=1
		
		
	if $area_right.move_left == true:
		$KinematicBody2D.position.x -=1
		default_move = false
		
		
	if $Area_left.move_right == true:
		$KinematicBody2D.position.x +=1
		default_move = false
		
		
		print("YEEEEEEE")
		
	
	
		
	
	

