extends Node2D
var collision = false
var life = 3
var turningSpeed = 6

func _process(delta):
	if Input.is_action_pressed("move_left"):
		if position.x > 100:
			position.x -= turningSpeed
		
	if Input.is_action_pressed("move_right"):
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
	if life == 0:
		get_tree().change_scene("res://scenes/Menu.tscn")
	collision = true
	
