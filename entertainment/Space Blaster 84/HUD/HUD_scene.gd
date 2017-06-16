extends Node

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func set_gameOver(highScore):
	get_node("label_gameOver").set_text("GAME OVER!\n\n\nHigh Score:\n\n" + str(highScore) + "\n\n\nPress Enter to\n\nPlay Again!")
	get_node("label_gameOver").show()
	
func set_running():
	get_node("label_gameOver").hide()
	get_node("label_menu").hide()
	
func set_score(theScore):
	get_node("label_score").set_text("Score: " + str(theScore))
