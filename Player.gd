extends Node2D
var collision = false
var life = 3
onready var hud = $Hud

func _process(delta):
	if Input.is_action_pressed("move_left"):
		if position.x > 100:
			position.x -= 10
		
	if Input.is_action_pressed("move_right"):
		if position.x < 390:
			position.x += 10
	
	if collision:
		rotation_degrees += 6
	
	if rotation_degrees >= 1080:
		collision = false
		rotation_degrees = 0

func _on_Player_area_entered(area):
	life -= 1
	if life == 0:
		get_tree().change_scene("res://scenes/Menu.tscn")
	collision = true
	
