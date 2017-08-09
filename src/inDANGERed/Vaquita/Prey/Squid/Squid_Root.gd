extends Node

func _ready():
	set_fixed_process(true)
	get_node("Squid_Area2D").connect("body_enter", self, "_test_collision")
	var x = 1940
	var y = 500
	get_node("Squid_Area2D").set_pos(Vector2(x, y))

func _fixed_process(delta):
	if Globals.has("gameRun_leop"):
		get_node("Squid_Area2D").set_pos(Vector2(get_node("Squid_Area2D").get_pos().x - 7.5, get_node("Squid_Area2D").get_pos().y))
		if Globals.get("gameRun_leop") == false:
			get_node(".").queue_free()

func _test_collision(body): # Code taht runs when an object enters Hare_Area2D
	Globals.set("gameScore", Globals.get("gameScore") + 1)
	Globals.set("healthRegen", Globals.get("healthRegen") + 1)
	queue_free()