extends RichTextLabel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var anim_timer = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	anim_timer +=1
	if anim_timer % 50 == 0:
		visible = true
	if anim_timer % 100 == 0:
		visible = false
		
	
