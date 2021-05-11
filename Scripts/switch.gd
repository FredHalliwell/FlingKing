extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var switch_colliding_with



# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#$"/root/singleton".singleton_switch_platform_timer does not increase. dunno y

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if $platform_check.scale == Vector2(75,75):
		$"/root/singleton".singleton_switch_platform_timer += 0.5
		
	
	
	
	
	if $"/root/singleton".singleton_switch_platform_timer == 600:
		$platform_check.scale = Vector2(1,1)
		$"/root/singleton".singleton_switch_platform_timer = 0
		
		


func _on_switch_body_entered(body):
	if body.get_name() == "player_rigidbody":
		
		$collected_sfx.play()
		
		$"/root/singleton".singleton_switch_platform_timer = 0
		
		$platform_check.scale = Vector2(75,75)
		
		
