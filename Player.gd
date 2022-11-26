extends Node2D
var collision = false
var life = 3
var turningSpeed = 6
onready var life1 = get_node("../Hud/life1")
onready var life2 = get_node("../Hud/life2")
onready var life3 = get_node("../Hud/life3")

func _process(delta):
	if Input.is_action_pressed("move_left") && Input.is_action_pressed("accelerate"):
		if position.x > 100:
			position.x -= turningSpeed
		
	if Input.is_action_pressed("move_right") && Input.is_action_pressed("accelerate"):
		if position.x < 390:
			position.x += turningSpeed
	
	if collision:
		rotation_degrees += 6
	
	if rotation_degrees >= 1080:
		collision = false
		rotation_degrees = 0
	
func _on_Player_area_entered(area):
	if not $playerCrash.playing:
		$playerCrash.play()
	life -= 1
	if life == 2:
		life1.visible = false
	if life == 1:
		life2.visible = false
	if life == 0:
		life3.visible = false
	
	if life == 0:
		get_tree().change_scene("res://scenes/Menu.tscn")
	collision = true
	
