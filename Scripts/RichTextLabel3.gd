extends RichTextLabel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var fade = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if fade > 0:
		fade -=0.01
	if fade < 1:
		modulate = Color(1,1,1,fade)
