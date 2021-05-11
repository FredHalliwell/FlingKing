extends MeshInstance2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var play_jump_animation

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#flip animation depending on shoot angle
	if $"/root/singleton".singleton_shoot_direction != null and $"/root/singleton".singleton_player_colliding_with != null:
		if $"/root/singleton".singleton_shoot_direction.x > 0:
			$jump_animation.flip_h = false
		else:
			$jump_animation.flip_h = true
	
	#play jump animation
	
	if play_jump_animation == true:
		if $jump_animation.frame < 3:
			$jump_animation.playing = true
			
		else:
			$jump_animation.playing = false
		
	else:
		$jump_animation.frame = 0
		$jump_animation.playing = false
		
	
	
		
	
