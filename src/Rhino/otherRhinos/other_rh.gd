extends Node

var other = preload("res://otherRhinos/otherRhino_root.tscn")
var createRhino = false

func _ready():
	set_process(true)
	Globals.set("gameRun_rh", true)
	
func _process(delta):
	if createRhino == true:
		var newRhino = other.instance()
		add_child(newRhino)
		newRhino.set_owner(self)
		createRhino = false

func _on_Timer_timeout():
	if Globals.get("gameRun_rh") == true:
		createRhino = true
