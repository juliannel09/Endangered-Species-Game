extends Node

var health = 100
var returnPressed = false

func _ready():
	set_process(true)
	Globals.set("gameRun_rh", false)
	Globals.set("health_rh", 100)
	
# user input start/stop
func _process(delta):
	if Input.is_action_pressed("ui_quit"):
		get_tree().quit()
	if Globals.get("gameRun_rh") == true:
		run_game(delta)
	else:
		if returnPressed:
			get_node("healthRh_root").set_health(0)
		if Input.is_action_pressed("ui_accept"):
			returnPressed = true
			start_game()
			
# start game
func start_game():
	Globals.set("gameRun_rh", true)
	Globals.set("health_rh", 100)
	
# Running loop
func run_game(delta):
	if Globals.get("health_rh")!=health:
		health = Globals.get("health_rh")
		get_node("healthRh_root").set_health(health)
	
	if Input.is_action_pressed("ui_cancel"):
		Globals.set("gameRun_rh", false)
