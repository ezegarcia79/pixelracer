extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var timer = $Timer
var time = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	text = time
	
	time += time / 60
	
