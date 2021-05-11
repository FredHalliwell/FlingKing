extends StaticBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var timer = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#if player lands on platform, start fade
	if $Area2D_fading_platform.fade == true and timer > 0:
		timer -= 0.02
		
		
		
		
		
		#play particle
		#play spound fx
		
	#if alpha becomes 0, disable collision
	
		
	#play breaking sound effect
	if timer > 0 and timer < 0.02:
		$rock_fx_2.play()
		
		#stops rock_fx_1 playing while platform is gone
		$Area2D_fading_platform/CollisionShape2D.disabled = true
		
	
	if timer < 0:
		timer -= 0.02
		collision_mask = 0
		
		$platform_broken.visible = false
		$platform_broken2.visible = false
		
		#emit breaking particle
		$Particles_2_1.emitting = true
		$Particles_2_2.emitting = true
		
		
		
	#enable collsion after alpha reaches -1, reset alpha and reset fade to false
	if timer  < -1:
		$Area2D_fading_platform.fade = false
		timer = 1
		
		$platform_broken.visible = true
		$platform_broken2.visible = true
		
		collision_mask = 1
		
		#re-enables rock_fx_1 sound effect
		$Area2D_fading_platform/CollisionShape2D.disabled = false
		
		
	
