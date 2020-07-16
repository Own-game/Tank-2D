extends Node


export (PackedScene) var Tank_bot

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	$TimerSpawn.start()



func _on_TimerSpawn_timeout():
	$TankPath/TankSpawnLocation.offset = randi()
	var bot = Tank_bot.instance()
	add_child(bot)
	$TankPath/TankSpawnLocation.rotation = PI/2
	bot.position = $TankPath/TankSpawnLocation.position
	bot.rotation = $TankPath/TankSpawnLocation.rotation + rand_range(-PI/4,PI/4)
