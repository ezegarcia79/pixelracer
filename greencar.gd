extends Area2D

var verticalSpeed
var halfDistance = (280 + 30) / 2
var increment = 1
var hasPassed = false


func _ready():
	randomize()
	
func _process(delta):
	if Input.is_action_pressed("accelerate"):
		position.y += verticalSpeed * delta
	
	if not hasPassed and (not $greenCarPassing.playing) and (position.y > 150):
		hasPassed = true
		$greenCarPassing.play()
		
	verticalSpeed = 1.008 * verticalSpeed
	if position.y > 2048 or position.y < -1024:
		queue_free()
	
	increment += 0.05
	position.x = (halfDistance + sin(increment) * halfDistance) + 90
