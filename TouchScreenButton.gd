extends TouchScreenButton

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var screenpress
var screenrelease
var screenpressheld

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	
	
	#makes screenpress active for one frame
	if $"/root/singleton".checkpoint_message_exists != true:
		if $"/root/singleton".screenpress == true:
			$"/root/singleton".screenpress = false
		
		
	#makes screenrelease active for one frame
	if $"/root/singleton".checkpoint_message_exists != true:
		if $"/root/singleton".screenrelease == true:
			$"/root/singleton".screenrelease = false
		


func _on_TouchScreenButton_pressed():
	if $"/root/singleton".checkpoint_message_exists != true:
		$"/root/singleton".screenpress = true
		$"/root/singleton".screenpressheld = true
		
	


func _on_TouchScreenButton_released():
	if $"/root/singleton".checkpoint_message_exists != true:
		$"/root/singleton".screenrelease = true
		$"/root/singleton".screenpressheld = false
	
