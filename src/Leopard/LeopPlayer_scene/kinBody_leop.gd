extends KinematicBody2D

var ground = preload("res://BG_leop_scene/BGleop_root.tscn")
var createBack = false
var newBack

var kinSpeed = Vector2(0, 0)
var canJump = false
var jumpTimer = 0

const JUMP = -700
const GRAV = Vector2(0, 1000)
const leopPadX = 200
const leopPadY = 120
const ACCEL = 0.5
const JUMP_TIME = 0.1

func _ready():
	set_fixed_process(true)
	newBack = ground.instance()
	add_child(newBack)
	newBack.set_owner(self)
	get_node(".").move_to(Vector2(390, newBack.get_node("ground/ground_mech").get_pos().y - 37))
	Globals.set("gameRun_leop", true)
	
func _fixed_process(delta):
	if Globals.get("gameRun_leop")==true:
		
		jumpTimer += delta
		
		if((newBack.get_node("ground/ground_mech").get_pos().y - 37)==(get_node(".").get_pos().y + 100)):
			jumpTimer = 0
		
		canJump = jumpTimer < JUMP_TIME
		
		if Input.is_action_pressed("ui_jump") and canJump:
			kinSpeed.y += JUMP
			jumpTimer = JUMP_TIME
			
		kinSpeed += GRAV*delta
		
		var movement = 0
			
		if (Input.is_action_pressed("ui_right")):
			movement += 400
		elif (Input.is_action_pressed("ui_left")):
			movement -= 400
		else:
			movement = 0
			
		
		kinSpeed.x = lerp(kinSpeed.x, movement, ACCEL)
		
		print(str(kinSpeed))
		kinSpeed = move(kinSpeed*delta)
		
		
		#if (get_pos().x<leopPadX):
			#kinSpeed.x = 0
			#move_to(Vector2(leopPadX, get_pos().y))
		#if (get_pos().x>(get_viewport().get_rect().size.x) - 2*leopPadX):
			#kinSpeed.x = 0
			#move_to(Vector2(get_viewport().get_rect().size.x - 2*leopPadX, get_pos().y))
		#if (get_pos().y<leopPadY):
			#kinSpeed.y = 0
			#move_to(Vector2(get_pos().x, leopPadY))
			
		#if get_node(".").is_colliding():
			#Globals.set("health_leop", Globals.get("health_leop") + get_collider().points)
			#get_collider().queue_free()
			
		#if Globals.get("health_leop")<=0:
			#kinSpeed = Vector2(0, 0)
			#Globals.set("gameRun_leop", false)
			
	else:
		kinSpeed = Vector2(0, 0)