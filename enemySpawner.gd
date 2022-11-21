extends Node2D

var preloadedEnemies = [
	preload("res://scenes/redcar.tscn"),
	preload("res://scenes/blackcar.tscn"),
	preload("res://scenes/greencar.tscn")
]

onready var spawnTimer = $spawnTimer
var enemyVariation = 2
var nextSpawnTime = 5.0


func _ready():
	randomize()
	spawnTimer.start(nextSpawnTime)
	
func _on_spawnTimer_timeout():
	var enemyPreload = preloadedEnemies[randi() % enemyVariation]
	var enemy = enemyPreload.instance()
	enemy.position = Vector2(randi() % 250 + 130, position.y)
	enemy.verticalSpeed = (randi() % 200 + 700)
	get_tree().current_scene.add_child(enemy)
	spawnTimer.start(nextSpawnTime)
	if nextSpawnTime >= 1.0:
		nextSpawnTime -= 0.5
	elif (nextSpawnTime > 0.7) and (nextSpawnTime < 1.0):
		nextSpawnTime -= 0.05
		enemyVariation = 3
		

	

