extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	if position.y < -15029.3:
		$Light2D.enabled = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_checkpoint_1_body_entered(body):
	if body.get_name() == "player_rigidbody":
		$flag_green.visible = true
		$flag_red.visible = false
		
		$Light2D.color = Color(0,1,0,1)
