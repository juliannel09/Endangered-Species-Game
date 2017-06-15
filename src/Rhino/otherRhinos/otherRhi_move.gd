extends RigidBody2D

var points = -85

func _ready():
	set_fixed_process(true)
	set_pos(Vector2(rand_range(50, 1000), -50))
	apply_impulse(get_pos(), Vector2(0, 300))
	
func _fixed_process(delta):
	if Globals.has("gameRun_rh"):
		if Globals.get("gameRun_rh") == false:
			get_node(".").queue_free()
	if get_pos().y>1920:
		get_node(".").queue_free()