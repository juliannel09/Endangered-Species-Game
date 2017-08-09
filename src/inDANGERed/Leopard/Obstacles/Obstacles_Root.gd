extends Node

# LOAD OBSTACLES
var hare = preload("res://Leopard/Obstacles/Hare_Root.tscn")
var tree = preload("res://Leopard/Obstacles/Tree_Root.tscn")
var firetree = preload("res://Leopard/Obstacles/Fire_Tree_Root.tscn")
var bullet = preload("res://Leopard/Obstacles/Bullet_Root.tscn")
#var net = preload("res://Obstacles/Net_Node.tscn")
var burningtree = preload("res://Leopard/Obstacles/Burning_Tree_Root.tscn")

var createObstacle = false
var newObstacle # Used to create instance of an obstacle
var rand # Used to create a random number 

func _ready():
	set_process(true)
	Globals.set("gameRun_leop", true)

func _process(delta):
	Globals.set("difficulty", Globals.get("difficulty")+1)
#	print(Globals.get("difficulty"))
	
	if createObstacle:
#		newObstacle = tree.instance()
#		add_child(newObstacle)
#		newObstacle.set_owner(self)
		if Globals.get("difficulty") < 5000: # Spawn rate will change based on time elapsed
			rand = rand_range(0, 5)
			if rand <= 2:
				newObstacle = tree.instance()
				add_child(newObstacle)
				newObstacle.set_owner(self)
			elif rand <= 4:
				newObstacle = hare.instance()
				add_child(newObstacle)
				newObstacle.set_owner(self)
			else:
				pass
			rand = rand_range(0, 3)
			if rand <= 1:
				newObstacle = bullet.instance()
				add_child(newObstacle)
				newObstacle.set_owner(self)
		elif Globals.get("difficulty") < 10000:
			rand = rand_range(0, 5)
			if rand <= 1:
				newObstacle = tree.instance()
				add_child(newObstacle)
				newObstacle.set_owner(self)
			elif rand <= 2:
				newObstacle = firetree.instance()
				add_child(newObstacle)
				newObstacle.set_owner(self)
			elif rand <= 4:
				newObstacle = hare.instance()
				add_child(newObstacle)
				newObstacle.set_owner(self)
			else:
				pass
			rand = rand_range(0, 2)
			if rand <= 1:
				newObstacle = bullet.instance()
				add_child(newObstacle)
				newObstacle.set_owner(self)
		else:
			rand = rand_range(0, 5)
			if rand <= 2:
				newObstacle = firetree.instance()
				add_child(newObstacle)
				newObstacle.set_owner(self)
			elif rand <= 3:
				newObstacle = burningtree.instance()
				add_child(newObstacle)
				newObstacle.set_owner(self)
			elif rand <= 4:
				newObstacle = hare.instance()
				add_child(newObstacle)
				newObstacle.set_owner(self)
			else:
				pass
			rand = rand_range(0, 3)
			if rand <= 2:
				newObstacle = bullet.instance()
				add_child(newObstacle)
				newObstacle.set_owner(self)
		createObstacle = false

func _on_Timer_timeout():
	if Globals.get("gameRun_leop"):
		createObstacle = true
