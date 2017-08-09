extends Node

func _ready():
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	if Globals.get("healthRegen") == 4: # If four hares have been eaten regen health
		Globals.set("healthRegen", 0)
		if Globals.get("health_leop") != 4: # If Leopard is not already at max health
			Globals.set("health_leop", Globals.get("health_leop") + 1)
			if Globals.get("health_leop") == 2:
				get_node("Label_Health/Sprite1").show()
			if Globals.get("health_leop") == 3:
				get_node("Label_Health/Sprite2").show()
			if Globals.get("health_leop") == 4:
				get_node("Label_Health/Sprite3").show()
	elif Globals.get("health_leop") == 1: # Hide health bar if Hare loses health
		get_node("Label_Health/Sprite1").hide()
	elif Globals.get("health_leop") == 2:
		get_node("Label_Health/Sprite2").hide()
	elif Globals.get("health_leop") == 3:
		get_node("Label_Health/Sprite3").hide()
	else:
		pass

func _set_Game_Over(highscore):
	get_node("Label_Health").hide()
	get_node("Label_Score").hide()
	get_node("Health_Score_Sprite").hide()
	get_node("Label_Game_Over").set_text("GAME OVER\n\n\nHigh Score:\n\n" + str(highscore) + "\n\n\nPress Enter to\n\nPlay Again")
	get_node("Game_Over_Sprite").show()
	get_node("Label_Game_Over").show()

func set_Running():
	get_node("Game_Over_Sprite").hide()
	get_node("Label_Game_Over").hide()
	get_node("Menu_Sprite").hide()
	get_node("Label_Menu").hide()
	get_node("Label_Health").show()
	get_node("Label_Score").show()
	get_node("Health_Score_Sprite").show()
	get_node("Label_Health/Sprite").show()
	get_node("Label_Health/Sprite1").show()
	get_node("Label_Health/Sprite2").show()
	get_node("Label_Health/Sprite3").show()

func set_Score(theScore):
	get_node("Label_Score").set_text("SCORE: " + str(theScore))

#func set_Health(health):
#	get_node("Label_Health").set_text("HEALTH: " + str(health))

func hide_last_sprite():
	get_node("Label_Health/Sprite").hide()
