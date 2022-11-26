extends Area2D

var verticalSpeed = 300
var hasPassed = false

func _ready():
	randomize()
	
func _process(delta):
	if parallax.gearShift == 'lo' && false:
		verticalSpeed = verticalSpeed / 2
	else:
		verticalSpeed = verticalSpeed
		
	if Input.is_action_pressed("accelerate"):
		position.y += verticalSpeed * delta
	else:
		position.y -= verticalSpeed * delta
	
	if not hasPassed and (not $redCarPassing.playing) and (position.y > 150):
		hasPassed = true
		$redCarPassing.play()
		
		
	verticalSpeed = 1.008 * verticalSpeed
	if position.y > 2048 or position.y < -1024:
		queue_free()
