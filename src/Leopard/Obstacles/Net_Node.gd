extends Node

func _ready():
	set_fixed_process(true)
	get_node("RigidBody2D").set_pos(Vector2(1940, rand_range(0, 500)))
	get_node("RigidBody2D").apply_impulse(get_node("RigidBody2D").get_pos(), Vector2(-800, 10))
	get_node("RigidBody2D").set_angular_velocity(rand_range(-5, 5))

func _fixed_process(delta):
	if Globals.has("gameRun_leop"):
		if Globals.get("gameRun_leop") == false or Globals.get("net_collision") == true: 
			get_node(".").queue_free()
			print("ok")
			Globals.set("gameLevel", false)
	if get_node("RigidBody2D").get_pos().y > 1000:
		get_node(".").queue_free()
