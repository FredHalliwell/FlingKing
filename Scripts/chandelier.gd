extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if frame == 0:
		$Light2D.position = Vector2(0, 12)
	if frame == 1:
		$Light2D.position = Vector2(-1, 11)
	if frame == 2:
		$Light2D.position = Vector2(0, 12)
	if frame == 1:
		$Light2D.position = Vector2(1, 11)
		
