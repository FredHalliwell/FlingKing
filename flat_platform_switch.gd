extends StaticBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var show_platform
var show_platform_timer = 0
var alpha = 1
var GB = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#if the timer is at 0, reset alpha and colour
	#red is created by reducing green and blue, hence GB var name
	if show_platform_timer == 0:
		alpha = 1
		GB = 1
	
	
	#start timer
	if show_platform == true and show_platform_timer < 600:
		show_platform_timer +=0.5
		
		if show_platform_timer == 0.5:
			$slow_tick.playing = true
			
			
	
	#if timer reaches max, hide platform and disable collisions
	elif show_platform_timer == 600:
		show_platform = false
		$platform2.visible = false
		collision_mask = 0
	
	#reduce alpha and increase red colour as timer progresses
	if show_platform_timer != null and show_platform_timer > 1:
		alpha -= 0.00075
		GB -= 0.00075
		$platform2.modulate = Color(1, GB, GB, alpha)
		
	if $"/root/singleton".singleton_switch_platform_timer == 1:
		alpha = 1
		GB = 1
		
		show_platform = true
		$platform2.visible = true
		collision_mask = 1
		
		show_platform_timer = 0
		
		
	
	
	
		
		

#checks if area around switch is colliding with a platform after player collides with switch, if so;
func _on_check_for_switch_area_area_entered(area):
	if area.get_name() == "platform_check":
		
		#show platform, activate collision
		$platform2.visible = true
		collision_mask = 1
		
		show_platform = true
		
