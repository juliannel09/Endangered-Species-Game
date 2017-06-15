extends KinematicBody2D

var maxSpeed = 300
var accel = 20
var kinSpeed = Vector2(0, 0)
var rhinoPadX = 65
var rhinoPadY = 270

func _ready():
	set_fixed_process(true)
	get_node(".").move_to(Vector2(540, 1450))
	
func _fixed_process(delta):
	if Globals.get("gameRun_rh")==true:
		if (Input.is_action_pressed("ui_up")) or (Input.is_action_pressed("ui_down")) or (Input.is_action_pressed("ui_left")) or (Input.is_action_pressed("ui_right")):
			if (Input.is_action_pressed("ui_up")):
				if kinSpeed.y > -maxSpeed:
					kinSpeed += Vector2(0, -accel)
			if (Input.is_action_pressed("ui_down")):
				if kinSpeed.y < maxSpeed:
					kinSpeed += Vector2(0, accel)
			if (Input.is_action_pressed("ui_right")):
				if kinSpeed.x < maxSpeed:
					kinSpeed += Vector2(accel, 0)
			if (Input.is_action_pressed("ui_left")):
				if kinSpeed.x > -maxSpeed:
					kinSpeed += Vector2(-accel, 0)
		else:
			kinSpeed.x = lerp(kinSpeed.x, 0, 0.03)
			kinSpeed.y = lerp(kinSpeed.y, 0, 0.03)
			
		move(kinSpeed*delta)
		
		if (get_pos().x<rhinoPadX):
			kinSpeed.x = 0
			move_to(Vector2(rhinoPadX, get_pos().y))
		if (get_pos().x>get_viewport().get_rect().size.x - rhinoPadX):
			kinSpeed.x = 0
			move_to(Vector2(get_viewport().get_rect().size.x - rhinoPadX, get_pos().y))
		if (get_pos().y<(rhinoPadY + 0.5*(get_viewport().get_rect().size.y))):
			kinSpeed.y = 0
			move_to(Vector2(get_pos().x, rhinoPadY + 0.5*(get_viewport().get_rect().size.y)))
		if (get_pos().y>get_viewport().get_rect().size.y - rhinoPadY):
			kinSpeed.y = 0
			move_to(Vector2(get_pos().x, get_viewport().get_rect().size.y - rhinoPadY))
			
		if get_node(".").is_colliding():
			get_collider().add_collision_exception_with(get_node("."))
			
		if Globals.get("health")<=0:
			kinSpeed = Vector2(0, 0)
			Globals.set("gameRun_rh", false)
			
	else:
		kinSpeed = Vector2(0, 0)
		get_node(".").move_to(Vector2(540, 1450))