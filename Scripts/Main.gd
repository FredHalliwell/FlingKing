extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var score = 0
var highscore = 0

var player_velocity

const checkpoint_message_instance = preload("res://checkpoint_message.tscn")
const checkpoint_reminder_instance = preload("res://Button_checkpoint_reset.tscn")

var checkpoint_reminder_instance_for_Qfree = checkpoint_reminder_instance.instance()

var checkpoint_reminder_exists






# Called when the node enters the scene tree for the first time.
func _ready():
	#position preview_instance on current position of player, pass object in to singleton
	$"/root/singleton".singleton_player_object = $player_rigidbody
	
	
	
	
	
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	
	#create checkpoint message
	if $"/root/singleton".create_checkpoint_message_instance == true:
		add_child(checkpoint_message_instance.instance())
		
		
	#create reset checkpoint reminder
	#if checkpoint message doesnt exist and checkpoint reminder doesnt exist
	if get_node("checkpoint_message") == null and get_node("Button_checkpoint_reset") == null:
		#if player has already reached a checkpoint
		if $player_rigidbody.current_checkpoint != null:
			if $"/root/singleton".reject_checkpoint == true:
				#create the checkpoint reminder
				add_child(checkpoint_reminder_instance.instance())
				checkpoint_reminder_exists = true
				
				$"/root/singleton".reject_checkpoint = false
				
	#remove reminder if player is above current checkpoint
	#if player has reached a checkpoint
	if $"/root/singleton".singleton_current_checkpoint_position != null:
		#if checkpoint reminder exists
		if checkpoint_reminder_exists == true:
			#if player is above current checkpoint
			if $player_rigidbody.position.y < $"/root/singleton".singleton_current_checkpoint_position.y and $player_rigidbody.linear_velocity.y == 0:
				#if the checkpoint reminder exists
				if $"/root/singleton".checkpoint_reminder_object_singleton != null:
						$"/root/singleton".checkpoint_reminder_object_singleton.queue_free()
						
						
					
	
					
	

	#put flinged ball mesh on top of ball
	$player_flinged_shape.position = $player_rigidbody.position
	
	
	
	
	#make flinged ball visible if ball is flinged, make round ball visible if not.
	#if player is on the ground
	if $player_rigidbody.colliding_with != null or $"/root/singleton".singleton_player_on_vertical_platform == true:
		#show ball
		$player_rigidbody/player_CollisionShape2D/MeshInstance2D.visible = true
		$player_rigidbody/knight.visible = true
		#hide flinged ball
		$player_flinged_shape.visible = false
		$player_flinged_shape.play_jump_animation = false
		
	elif $player_rigidbody.colliding_with == null:
		#hide ball
		$player_rigidbody/player_CollisionShape2D/MeshInstance2D.visible = false
		$player_rigidbody/knight.visible = false
		#show flinged ball
		$player_flinged_shape.visible = true
		$player_flinged_shape.play_jump_animation = true
		
	
	
		
	
	#set camera on player
	$Camera_player.position.y = $player_rigidbody.position.y
	
	
	
			
			
			
	
		
			
	
		
		
		
		
		
	
	
		
		
		
		
	




