extends KinematicBody2D

var maxSpeed = 700
var accel = 20
var kinSpeed = Vector2(0, 0)
var shipPadX = 58
var shipPadY = 120
var firePressed = false
var laser = preload("res://Laser/laser_root.tscn")
var laserCount = 0

func _ready():
	set_fixed_process(true)
	get_node(".").move_to(Vector2(540, 1450))
	
func _fixed_process(delta):
	if Globals.get("gameRun"):
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
		
		if (get_pos().x<shipPadX):
			kinSpeed.x = 0
			move_to(Vector2(shipPadX, get_pos().y))
		if (get_pos().x>get_viewport().get_rect().size.x - shipPadX):
			kinSpeed.x = 0
			move_to(Vector2(get_viewport().get_rect().size.x - shipPadX, get_pos().y))
		if (get_pos().y<shipPadY):
			kinSpeed.y = 0
			move_to(Vector2(get_pos().x, shipPadY))
		if (get_pos().y>get_viewport().get_rect().size.y - shipPadY):
			kinSpeed.y = 0
			move_to(Vector2(get_pos().x, get_viewport().get_rect().size.y - shipPadY))
			
		if Input.is_action_pressed("ui_select") and !firePressed:
			laserCount += 1
			var laztemp = laser.instance()
			laztemp.set_name("Laser" + str(laserCount))
			add_child(laztemp)
			laztemp.set_owner(self)
			laztemp.set_pos(get_pos() + Vector2(0, -92))
			get_node("Laser" + str(laserCount) + "/KinematicBody2D").add_collision_exception_with(get_node("."))
		firePressed = Input.is_action_pressed("ui_select")
			
		if get_node(".").is_colliding(): #only be rock
			kinSpeed = Vector2(0, 0)
			Globals.set("gameLvl", false)
		
	else:
		kinSpeed = Vector2(0, 0)
		get_node(".").move_to(Vector2(540, 1450))