extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

#timer var to check for colour flash text timing



# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#position button
	rect_position = $"/root/singleton".camera_position + Vector2(150,-440)
	
	#if player rejects to play advert
	if $"/root/singleton".reject_checkpoint == true:
		queue_free()
	#if message asking player to play advert exists
	if $"/root/singleton".create_checkpoint_message_instance == true:
		queue_free()
		
		
	#THERE IS PROBABLY A GLITCH WITH QUEUE_FREE() WHEN PLAYING ADVERT 
	#RATHER THAN REJECTING


func _on_Button_checkpoint_reset_pressed():
	
	#show checkpoint message
	$"/root/singleton".create_checkpoint_message_instance = true
	#stop player from shooting while checkpoint message exists
	$"/root/singleton".checkpoint_message_exists = true
	$"/root/singleton".screenrelease = false
	queue_free()
	
	


func _on_Button_checkpoint_reset_button_down():
	modulate = Color(0.75,0.75,0.75)
