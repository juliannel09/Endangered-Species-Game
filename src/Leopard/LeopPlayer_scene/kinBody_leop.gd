extends KinematicBody2D

var ground = preload("res://BG_leop_scene/BGleop_root.tscn")
var net = preload("res://Obstacles/Net_Node.tscn")

var createBack = false
var newBack
var checkNet
#var newPlatform

var kinSpeed = Vector2(0, 0)
var motion = Vector2(0, 0)
var canJump = false
var jumpTimer = 0

const JUMP = -700
const GRAV = 1000
const leopPadX = 200
const leopPadY = 120
const ACCEL = 0.5
const JUMP_TIME = .1


func _ready():
	set_fixed_process(true)
	newBack = ground.instance()
	#checkNet = net.instance()
	add_child(newBack)
	#add_child(checkNet)
	newBack.set_owner(self)
	#checkNet.set_owner(self)
	get_node(".").move_to(Vector2(390, newBack.get_node("ground/ground_mech").get_pos().y - 130.5))
	Globals.set("gameRun_leop", true)
	
func _fixed_process(delta):
	if Globals.get("gameRun_leop")==true:
		
		if (Input.is_action_pressed("ui_right")):
			kinSpeed.x = 700
		elif (Input.is_action_pressed("ui_left")):
			kinSpeed.x = -700
		else:
			kinSpeed.x = 0
		
		
		"""
		var floorpos = newBack.get_node("ground/ground_mech").get_pos()
		var leoppos = get_node(".").get_pos()
		#print(str(leoppos.y) + " " + str(floorpos.y))
		if(floorpos.y - 132 <=leoppos.y) && (floorpos.y - 130 >= leoppos.y):
			jumpTimer = 0
		"""
		
		if is_colliding():
			# check if the collision is with the FLOOR!
			var collider = get_collider()
			if collider != newBack.get_node("ground"):
				print(str(collider))
#			if collider == checkNet.get_node("RigidBody2D"):
#				Globals.set("gameLevel", false)
			if Input.is_action_pressed("ui_jump") \
				and (collider == newBack.get_node("ground")) :#or (collider == newBack.get_node("Obstacles_Root").get_node())):
				#if collider==newBack.get_node("ground"):
					kinSpeed.y = JUMP
					motion = kinSpeed*delta
			else:
				motion = get_collision_normal().slide(motion)
				kinSpeed = get_collision_normal().slide(kinSpeed)
		else:
			kinSpeed.y += GRAV*delta
			
		motion = kinSpeed*delta
		move(motion)
		
		if (get_pos().x<leopPadX):
			kinSpeed.x = 0
			move_to(Vector2(leopPadX, get_pos().y))
		# get_viewport().get_rect().size.x) - 2*leopPadX (previous line of code in the following if statement)
		if (get_pos().x>(960-leopPadX)):
			kinSpeed.x = 0
			move_to(Vector2(960-leopPadX, get_pos().y))
		if (get_pos().y<leopPadY):
			kinSpeed.y = 0
			move_to(Vector2(get_pos().x, leopPadY))

		#if get_node(".").is_colliding():
			#Globals.set("health_leop", Globals.get("health_leop") + get_collider().points)
			
		if Globals.get("health_leop")<=0:
			kinSpeed = Vector2(0, 0)
			Globals.set("gameRun_leop", false)

	else:
		kinSpeed = Vector2(0, 0)