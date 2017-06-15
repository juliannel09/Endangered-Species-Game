extends Node

var health = 100

func _ready():
	set_process(true)
	Globals.set("gameRun_rh", false)
	Globals.set("health", health)
	
# user input start/stop
func _process(delta):
	if Input.is_action_pressed("ui_quit"):
		get_tree().quit()
	if Globals.get("gameRun_rh") == true:
		run_game(delta)
	else:
		if Input.is_action_pressed("ui_accept"):
			start_game()
			
# start game
func start_game():
	health = 100
	Globals.set("gameRun_rh", true)
	Globals.set("health", 100)
	
# Running loop
func run_game(delta):
	if Globals.get("health")!=health:
		health = Globals.get("health")
		get_node("healthRh_root").set_health(health)
	
	if Input.is_action_pressed("ui_cancel"):
		Globals.set("gameRun_rh", false)
