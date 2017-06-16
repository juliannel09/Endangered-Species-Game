extends Node

var rockL = preload("res://Rocks/rockL.tscn")
var rockM = preload("res://Rocks/rockM.tscn")
var rockS = preload("res://Rocks/rockS.tscn")

var createRock = false

func _ready():
	set_process(true)
	Globals.set("gameRun", true)
	
func _process(delta):
	if createRock == true:
		var number = rand_range(0, 3)
		if number <= 1:
			var newRock = rockL.instance()
			add_child(newRock)
			newRock.set_owner(self)
			#print("Large Rock")
		elif number <= 2:
			var newRock = rockM.instance()
			add_child(newRock)
			newRock.set_owner(self)
			#print("Medium Rock")
		elif number <= 3:
			var newRock = rockS.instance(    )
			add_child(newRock)
			newRock.set_owner(self)
			#print("Small Rock")
		createRock = false

func _on_Timer_timeout():
	if Globals.get("gameRun") == true:
		createRock = true
