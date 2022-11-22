extends ParallaxBackground

export (float) var scrolling_speed = 500
var deaccelerateTimer = 0
var deaccelerateSpeed = 500
var gearShift = 'lo'

onready var gearLo = get_node("../Hud/gearLo")
onready var gearHi = get_node("../Hud/gearHi")
	
func _process(delta):
	
	if Input.is_action_pressed("accelerate") and gearShift == 'lo':
		scroll_offset.y += scrolling_speed/2 * 2 * delta
	
	if Input.is_action_pressed("accelerate") and gearShift == 'hi':
		scroll_offset.y += scrolling_speed * 2 * delta
	
	if Input.is_action_just_released("gearShift"):
		if gearLo != null:
			if gearShift == 'lo':
				gearLo.visible = false
				gearHi.visible = true
				gearShift = 'hi'
			elif gearShift == 'hi':
				gearLo.visible = true
				gearHi.visible = false
				gearShift = 'lo'
