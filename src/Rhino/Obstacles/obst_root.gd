extends Node

var createObst = false

var otherRh = preload("res://Obstacles/otherRhinos/otherRhino_root.tscn")
var bush = preload("res://Obstacles/Bush_rt.tscn")


func _ready():
	set_process(true)
	Globals.set("gameRun_rh", true)
	
func _process(delta):
	if createObst == true:
		var number = rand_range(0, 2)
		if number <= 1:
			var newRhino = otherRh.instance()
			add_child(newRhino)
			newRhino.set_owner(self)
		if number <= 2:
			var newBush = bush.instance()
			add_child(newBush)
			newBush.set_owner(self)
		createObst = false
		

func _on_Timer_timeout():
	if Globals.get("gameRun_rh") == true:
		createObst = true
