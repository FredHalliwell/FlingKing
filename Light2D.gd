extends Light2D


onready var noise = OpenSimplexNoise.new()
var value = 0.0
const MAX_VALUE = 1000000000


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	value = randi() % MAX_VALUE
	noise.period = 50


func _process(delta):
	value += 1
	if (value > MAX_VALUE):
		value = 0.0
	var alpha = ((noise.get_noise_1d(value) + 1) / 4.0) + 0.5
	
	self.color= Color(color.r, color.g, color.b, alpha)
	
	
	
	
	
	
