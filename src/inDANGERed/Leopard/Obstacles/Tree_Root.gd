extends Node

func _ready():
	set_fixed_process(true)
	get_node("Tree_Area2D").connect("body_enter", self, "_test_collision")
	get_node("Tree_Area2D/Jump_Area2D").connect("body_enter", self, "jump")
	var x = 2250
	var y = 650
	get_node("Tree_Area2D").set_pos(Vector2(x, y))

func _fixed_process(delta):
	if Globals.has("gameRun_leop"):
		get_node("Tree_Area2D").set_pos(Vector2(get_node("Tree_Area2D").get_pos().x - 7.5, get_node("Tree_Area2D").get_pos().y))
		if Globals.get("gameRun_leop") == false:
			get_node(".").queue_free()

func _test_collision(body): # Game Over if Leopord crashes into tree
	Globals.set("gameLevel", false)

func jump(body): # So leopard can jump on tree branches
	Globals.set("canJump", true)
	print(Globals.get("canJump"))