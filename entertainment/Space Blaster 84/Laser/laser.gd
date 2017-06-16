extends Node

var speed = -1920

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	get_node("KinematicBody2D").move(Vector2(0, speed*delta))
	if get_node("KinematicBody2D").get_global_pos().y<0 or get_node("KinematicBody2D").is_colliding():
		if get_node("KinematicBody2D").is_colliding():
			get_node("KinematicBody2D").get_collider().durability -= 1
		get_node(".").queue_free()
		
func set_pos(pos):
	get_node("KinematicBody2D").set_pos(pos)
	