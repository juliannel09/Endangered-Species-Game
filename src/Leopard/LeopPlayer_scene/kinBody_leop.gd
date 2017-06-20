extends KinematicBody2D

var ground = preload("res://BG_leop_scene/BGleop_root.tscn")
var createBack = false

var maxSpeed = 300
var accel = 20
var kinSpeed = Vector2(0, 0)
var leopPadX = 200
var leopPadY = 120

var newBack;

const JUMP_FORCE = 1100
const GRAV = 2000

func _ready():
	set_fixed_process(true)
	get_node(".").move_to(Vector2(390, 890))
	
func _fixed_process(delta):
	if Globals.get("gameRun_leop")==true:
		if !createBack:
			newBack = ground.instance()
			add_child(newBack)
			newBack.set_owner(self)
			createBack = true
		
		if (Input.is_action_pressed("ui_left")) or (Input.is_action_pressed("ui_right")):
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
		
		if Input.is_action_pressed("ui_jump") and get_node(".").is_colliding():
			kinSpeed.y = - JUMP_FORCE
			
		kinSpeed.y += GRAV*delta
		
		if (get_pos().x<leopPadX):
			kinSpeed.x = 0
			move_to(Vector2(leopPadX, get_pos().y))
		if (get_pos().x>(get_viewport().get_rect().size.x) - 2*leopPadX):
			kinSpeed.x = 0
			move_to(Vector2(get_viewport().get_rect().size.x - 2*leopPadX, get_pos().y))
		if (get_pos().y<leopPadY):
			kinSpeed.y = 0
			move_to(Vector2(get_pos().x, leopPadY))
		if (get_pos().y>get_viewport().get_rect().size.y - leopPadY):
			kinSpeed.y = 0
			move_to(Vector2(get_pos().x, get_viewport().get_rect().size.y - leopPadY))
			
		#if get_node(".").is_colliding():
			#Globals.set("health_leop", Globals.get("health_leop") + get_collider().points)
			#get_collider().queue_free()
			
		if Globals.get("health_leop")<=0:
			kinSpeed = Vector2(0, 0)
			Globals.set("gameRun_leop", false)
			
	else:
		kinSpeed = Vector2(0, 0)
		get_node(".").move_to(Vector2(470, 890))