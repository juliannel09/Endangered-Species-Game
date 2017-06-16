extends Node

var menu = load("Music/menu.ogg")
var lvl_01 = load("Music/lvl1.ogg")
var soundOn = true

func _ready():
	set_process_input(true)
	get_node("StreamPlayer").set_loop(true)
	get_node("StreamPlayer").set_stream(menu)
	get_node("StreamPlayer").play()
	
func set_music(music_select):
	if get_node("StreamPlayer").is_playing():
		get_node("StreamPlayer").stop()
	if music_select == "menu":
		get_node("StreamPlayer").set_stream(menu)
	elif music_select == "lvl_01":
		get_node("StreamPlayer").set_stream(lvl_01)
	if soundOn == true:
		get_node("StreamPlayer").play()

func _input(event):
	if event.is_action("ui_sound") && event.is_pressed() && !event.is_echo():
		if get_node("StreamPlayer").is_playing():
			get_node("StreamPlayer").stop()
			soundOn = false
		elif !get_node("StreamPlayer").is_playing():
			get_node("StreamPlayer").play()
			soundOn = true