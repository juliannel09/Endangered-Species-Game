extends KinematicBody2D

var maxSpeed = 300
var accel = 20
var kinSpeed = Vector2(0, 0)
var vaqPadX = 200
var vaqPadY = 120

func _ready():
	set_fixed_process(true)
	get_node(".").move_to(Vector2(390, 540))
	
func _fixed_process(delta):
	game_time += delta
	if Globals.get("gameRun_vaq")==true:
		if (Input.is_action_pressed("ui_up")) or (Input.is_action_pressed("ui_down")) or \
			(Input.is_action_pressed("ui_left")) or (Input.is_action_pressed("ui_right")):
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
		
		if (get_pos().x<vaqPadX):
			kinSpeed.x = 0
			move_to(Vector2(vaqPadX, get_pos().y))
		if (get_pos().x>(get_viewport().get_rect().size.x) - 2*vaqPadX):
			kinSpeed.x = 0
			move_to(Vector2(get_viewport().get_rect().size.x - 2*vaqPadX, get_pos().y))
		if (get_pos().y<vaqPadY):
			kinSpeed.y = 0
			move_to(Vector2(get_pos().x, vaqPadY))
		if (get_pos().y>get_viewport().get_rect().size.y - vaqPadY):
			kinSpeed.y = 0
			move_to(Vector2(get_pos().x, get_viewport().get_rect().size.y - vaqPadY))
			
		if get_node(".").is_colliding():
			Globals.set("health_vaq", Globals.get("health_vaq") + get_collider().points)
			get_collider().queue_free()
			
		if Globals.get("health_vaq")<=0:
			kinSpeed = Vector2(0, 0)
			Globals.set("gameRun_vaq", false)
			
	else:
		kinSpeed = Vector2(0, 0)
		get_node(".").move_to(Vector2(470, 540))