extends ParallaxBackground

export (float) var scrolling_speed = 500
var deaccelerateTimer = 0
var deaccelerateSpeed = 500

func _process(delta):
	if Input.is_action_pressed("accelerate"):
		scroll_offset.y += scrolling_speed * 2 * delta
