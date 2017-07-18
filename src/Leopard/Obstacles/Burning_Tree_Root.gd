extends Node

func _ready():
	set_fixed_process(true)
	get_node("Area2D").connect("body_enter", self, "_test_collision")
	var x = 2250
	var y = 635
	get_node("Area2D").set_pos(Vector2(x, y))

func _fixed_process(delta):
	if Globals.has("gameRun_leop"):
		get_node("Area2D").set_pos(Vector2(get_node("Area2D").get_pos().x - 7.5, get_node("Area2D").get_pos().y))
		if Globals.get("gameRun_leop") == false:
			get_node(".").queue_free()

func _test_collision(body): # Game Over if Leopord crashes into tree
	Globals.set("gameLevel", false)