extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var colliding_with = "right"
var move_right
var move_left

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if "left" in colliding_with:
		move_right = true
		move_left = false
	else:
		move_left = true
		move_right = false



	
func _on_travel_direction_area_area_entered(area):
	#stops colliding_with being assigned to wrong thing, such as player body
	if "left" in area.get_name() or "right" in area.get_name():
		colliding_with = area.get_name() 
