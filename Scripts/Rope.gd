extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var start_pos




# Called when the node enters the scene tree for the first time.
func _ready():
	start_pos = position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = start_pos
