extends Area2D

var verticalSpeed = 300
onready var hud = $Hud

func _ready():
	randomize()
	
func _process(delta):
	if Input.is_action_pressed("accelerate"):
		position.y += verticalSpeed * delta
	else:
		position.y -= verticalSpeed * delta

	verticalSpeed = 1.008 * verticalSpeed
	if position.y > 2048 or position.y < -1024:
		queue_free()
	
	if (not $blackCarPassing.playing) and (position.y > 150):
		$blackCarPassing.play()
		
func _on_Timer_timeout():
	if randi() % 1:
		position.x += 60
	else:
		position.x -= 60
