extends Node

func _ready():
	set_fixed_process(true)
	get_node("Gillnet_Area2D").connect("body_enter", self, "_test_collision")
	var x = 1940
	var y = 520
	get_node("Gillnet_Area2D").set_pos(Vector2(x, y))

func _fixed_process(delta):
	if Globals.has("gameRun_vaq"):
		get_node("Gillnet_Area2D").set_pos(Vector2(get_node("Gillnet_Area2D").get_pos().x - 18, get_node("Gillnet_Area2D").get_pos().y))
		if Globals.get("gameRun_vaq") == false:
			get_node(".").queue_free()

func _test_collision(body): # Code that runs when an object enters Bullet_Area2D
	if Globals.get("health_vaq") > 1:
		Globals.set("health_vaq", Globals.get("health_vaq") - 1)
	else:
		Globals.set("gameLevel", false)
	queue_free()