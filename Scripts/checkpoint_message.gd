extends Sprite

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	
	
	$"/root/singleton".create_checkpoint_message_instance = false
	
	$"/root/singleton".checkpoint_message_exists = true
	
	position.x = 255

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#set message to player position-250, as long as message has not been rejected
	if $TouchScreenButton_reject.reject_released != true:
		position.y = $"/root/singleton".singleton_player_pos.y - 250
	
	#reject button turn grey
	if $TouchScreenButton_reject.reject_pressed == true:
		$button_reject.modulate = Color(0.75, 0.75, 0.75)
	#reject button released
	if $TouchScreenButton_reject.reject_released == true:
		#disable main screentouch
		$"/root/singleton".checkpoint_message_exists = false
		#default colour
		$button_reject.modulate = Color(1,1,1)
		
		
		#move button off screen
		position = lerp(position, position - Vector2(0,500), 0.1)
		
		#hide blur background
		$blur_background.visible = false
		#if message is above screen
		if $"/root/singleton".singleton_player_pos.y - position.y > 1500:
			#tell Main root that advert has been rejected
			$"/root/singleton".reject_checkpoint = true
			#delete message once it is off the screen
			queue_free()
			
		
	if $TouchScreenButton_play.play_pressed == true:
		$button_play.modulate = Color(0.75, 0.75, 0.75)
	
	if $TouchScreenButton_play.play_released == true:
		$"/root/singleton".checkpoint_message_exists = false
		$button_play.modulate = Color(1,1,1)
		
		#play advert
		$"/root/singleton".play_interstital_singleton = true
		
		#remove checkpoint message
		queue_free()
		
		$TouchScreenButton_play.play_released = false
		
		
		
		
		
		
		
		
		
		
			
			
		
			
