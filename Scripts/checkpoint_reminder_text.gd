extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print("IN")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = $"/root/singleton".camera_position
