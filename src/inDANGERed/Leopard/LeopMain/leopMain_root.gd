extends Node

var health = 100

var score = 0
var highscore = 0

func _ready():
	set_process(true)
	Globals.set("gameRun_leop", false) # reg should be false later on!!!
	Globals.set("health_leop", 4)
	Globals.set("gameLevel", false) # Used to check if game is over
	Globals.set("gameScore", score) # SCORE IS UPDATED WITHIN THE 'OBSTACLES'.GD FILES
	Globals.set("healthRegen", 0) # when "healthRegen" reaches four Hare regens one health bar
	Globals.set("difficulty", 0) # Timer to change difficulty
	Globals.set("canJump", false)
	Globals.set("read", true)
	#Globals.set("pause", 0)
	#Globals.set("net_collision", false)

func _input(event):
	if event.is_action_pressed("ui_accept"):
		if Globals.get("gameLevel")==false:
			if Globals.get("read")==false:
				print("fuck you")
				get_node("Node/PopupPanel").hide()
				get_node("HUD_Root")._set_Game_Over(highscore)
				Globals.set("read", true)
			else:
				start_game()
		else:
			pass

# user input start/stop
func _process(delta):
	if Input.is_action_pressed("ui_quit"):
		get_tree().quit()
	if Globals.get("gameRun_leop") == true:
		run_game(delta)
	else:
		set_process_input(true)
			
# start game
func start_game():
	Globals.set("gameRun_leop", true)
	Globals.set("health_leop", 4)
	Globals.set("gameLevel", true)
	Globals.set("gameScore", 0)
	Globals.set("read", false)
	score = 0
	get_node("HUD_Root").set_Score(Globals.get("gameScore"))
	#get_node("HUD_Root").set_Health(Globals.get("health_leop"))
	get_node("HUD_Root").set_Running()
	get_node("Node/PopupPanel").hide()
	Globals.set("difficulty", 0)
	Globals.set("canJump", false)
	Globals.set("pause", 0)
	#Globals.set("net_collision", false)

	
# Running loop
func run_game(delta):
	if Globals.get("gameScore") > score:
		score = Globals.get("gameScore")
		get_node("HUD_Root").set_Score(score)
	
	if Globals.get("health_leop")!=health:
		health = Globals.get("health_leop")
		#get_node("HUD_Root").set_Health(health)
	
	if Input.is_action_pressed("ui_cancel") or Globals.get("gameLevel") == false:
		if Globals.get("health_leop") == 1 and Globals.get("gameLevel") == false:
			get_node("HUD_Root").hide_last_sprite()
		Globals.set("healthRegen", 0)
		Globals.set("gameRun_leop", false)
		if score >= highscore:
			highscore = score
		Globals.set("gameLevel", false) # USED FOR POPUP 
		get_node("Node/PopupPanel").popup() # Used to display fact after game over
		