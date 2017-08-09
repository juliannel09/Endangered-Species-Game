extends Node

# LOAD OBSTACLES
var gillnet = preload("res://Vaquita/Obstacles/Gillnet/Gillnet_Root.tscn")
var gillnet_1 = preload("res://Vaquita/Obstacles/Gillnet/Gillnet(1)_Root.tscn")
var gillnet_2 = preload("res://Vaquita/Obstacles/Gillnet/Gillnet(2)_Root.tscn")
var hook = preload("res://Vaquita/Obstacles/Fishing Hook/Fishing_Hook_Root.tscn")
var squid = preload("res://Vaquita/Prey/Squid/Squid_Root.tscn")
var fish_1 = preload("res://Vaquita/Prey/Fish_1/Fish_1_Root.tscn")
var fish_2 = preload("res://Vaquita/Prey/Fish_2/Fish_2_Root.tscn")

var createObstacle = false
var newObstacle
var rand

func _ready():
	set_process(true)
	Globals.set("gameRun_leop", true)

func _process(delta):
	Globals.set("difficulty", Globals.get("difficulty")+1)
	print(Globals.get("difficulty"))
	
	if createObstacle:
#		newObstacle = hook.instance()
#		add_child(newObstacle)
#		newObstacle.set_owner(self)
		if Globals.get("difficulty") < 10000:
			rand = rand_range(0, 5)
			if rand < 2:
				newObstacle = fish_1.instance()
				add_child(newObstacle)
				newObstacle.set_owner(self)
			elif rand < 4:
				newObstacle = fish_2.instance()
				add_child(newObstacle)
				newObstacle.set_owner(self)
			else:
				pass
		createObstacle = false

func _on_Timer_timeout():
	if Globals.get("gameRun_vaq"):
		createObstacle = true
