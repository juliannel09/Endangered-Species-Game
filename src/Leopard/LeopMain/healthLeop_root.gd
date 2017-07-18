extends Node

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func set_health(health):
	get_node("healthLeop").set_text("HEALTH: " + str(health))