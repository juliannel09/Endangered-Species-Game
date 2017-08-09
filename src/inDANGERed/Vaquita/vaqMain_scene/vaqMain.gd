extends Node

var health = 100
var returnPressed = false

var score = 0
var highscore = 0

func _ready():
	set_process(true)
	Globals.set("gameRun_vaq", false)
	Globals.set("health_vaq", 4)
	Globals.set("gameLevel", false) # Used to check if game is over
	Globals.set("gameScore", score) # SCORE IS UPDATED WITHIN THE 'OBSTACLES'.GD FILES
	Globals.set("healthRegen", 0) # when "healthRegen" reaches four Hare regens one health bar
	Globals.set("difficulty", 0)
	
# user input start/stop
func _process(delta):
	if Input.is_action_pressed("ui_quit"):
		get_tree().quit()
	if Globals.get("gameRun_vaq") == true:
		run_game(delta)
	else:
		if returnPressed:
#			get_node("healthVaq_root").set_health(0)
			pass
		if Input.is_action_pressed("ui_accept"):
			returnPressed = true
			start_game()
			
# start game
func start_game():
	Globals.set("gameRun_vaq", true)
	Globals.set("health_vaq", 4)

	Globals.set("gameLevel", true)
	Globals.set("gameScore", 0)
	score = 0
	get_node("HUD_Root(vaq)").set_Score(Globals.get("gameScore"))
	get_node("HUD_Root(vaq)").set_Running()
#	#get_node("HUD_Root").set_Health(Globals.get("health_leop"))
	get_node("Vaquita_Popup_Root/PopupPanel").hide()
	Globals.set("difficulty", 0)
#	Globals.set("canJump", false)
#	Globals.set("pause", 0)
	#Globals.set("net_collision", false)
	
# Running loop
func run_game(delta):
#	if Globals.get("health_vaq")!=health:
#		health = Globals.get("health_vaq")
#		get_node("healthVaq_root").set_health(health)
#	
#	if Input.is_action_pressed("ui_cancel"):
#		Globals.set("gameRun_vaq", false)
	if Globals.get("gameScore") > score:
		score = Globals.get("gameScore")
		get_node("HUD_Root(vaq)").set_Score(score)

	if Globals.get("health_leop")!=health:
		health = Globals.get("health_leop")
		#get_node("HUD_Root").set_Health(health)
	
	if Input.is_action_pressed("ui_cancel") or Globals.get("gameLevel") == false:
		print("game over")
		if Globals.get("health_vaq") == 1 and Globals.get("gameLevel") == false:
			get_node("HUD_Root(vaq)").hide_last_sprite()
		Globals.set("healthRegen", 0)
		Globals.set("gameRun_vaq", false)
		if score >= highscore:
			highscore = score
		get_node("HUD_Root(vaq)")._set_Game_Over(highscore)
		Globals.set("gameLevel", false) # USED FOR POPUP 
		get_node("Vaquita_Popup_Root/PopupPanel").popup() # Used to display fact after game over