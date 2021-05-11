extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass




func _on_TextureButton_button_up():
	$Node2D/start_up.visible = true
	$Node2D/start_down.visible = false


func _on_TextureButton_button_down():
	$Node2D/start_up.visible = false
	$Node2D/start_down.visible = true
	
	$Timer.start()


func _on_Timer_timeout():
	get_tree().change_scene("res://main.tscn")
