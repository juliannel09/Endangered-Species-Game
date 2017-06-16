extends Node

var theScore = 0
var highScore = 0

func _ready():
	set_process(true)
	Globals.set("gameRun", false)
	Globals.set("theScore", theScore)
	Globals.set("gameLvl", false)
	
# input from user to start/stop game
func _process(delta):
	if Input.is_action_pressed("ui_quit"):
		get_tree().quit()
	if Globals.get("gameRun") == true:
		run_game(delta)
	else:
		if Input.is_action_pressed("ui_accept"):
			start_game()
	
# load game level etc.
func start_game():
	theScore = 0
	get_node("HUD_root").set_score(theScore)
	get_node("label_info").set_text("Running")
	get_node("HUD_root").set_running()
	get_node("music_root").set_music("lvl_01")
	Globals.set("gameLvl", true)
	Globals.set("gameRun", true)
	Globals.set("theScore", 0)
	
# Running loop
func run_game(delta):
	if Globals.get("theScore")>theScore:
		theScore = Globals.get("theScore")
		get_node("HUD_root").set_score(theScore)
	
	if Input.is_action_pressed("ui_cancel") or Globals.get("gameLvl")==false:
		Globals.set("gameRun", false)
		get_node("music_root").set_music("menu")
		get_node("label_info").set_text("Game Over")
		if theScore >= highScore:
			highScore = theScore
		get_node("HUD_root").set_gameOver(highScore)
