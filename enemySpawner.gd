extends Node2D

var preloadedEnemies = [
	preload("res://scenes/redcar.tscn"),
	preload("res://scenes/blackcar.tscn"),
	preload("res://scenes/greencar.tscn")
]

onready var spawnTimer = $spawnTimer
onready var speed = get_node("../Road")

var enemyVariation = 3
var nextSpawnTime = 5.0


func _ready():
	randomize()
	spawnTimer.start(nextSpawnTime)
	
func _on_spawnTimer_timeout():
	print(speed.gearShift)
	
	var enemyPreload = preloadedEnemies[randi() % enemyVariation]
	var enemy = enemyPreload.instance()
	enemy.position = Vector2(randi() % 250 + 130, position.y)
	if speed.gearShift == 'lo':
		enemy.verticalSpeed = 500
	elif speed.gearShift == 'hi':
		enemy.verticalSpeed = 1000
		
	#enemy.verticalSpeed = (randi() % 200 + 700)
	get_tree().current_scene.add_child(enemy)
	spawnTimer.start(nextSpawnTime)
	if nextSpawnTime >= 1.0:
		nextSpawnTime -= 0.25
	elif (nextSpawnTime < 1.0):
		enemyVariation = 3
