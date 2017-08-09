extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _on_Leopard_pressed():
	get_tree().change_scene("res://Leopard/LeopMain/leopMain_root.tscn")
	pass # replace with function body

func _on_Vaquita_pressed():
	get_tree().change_scene("res://Vaquita/vaqMain_scene/vaqMain.tscn")
	pass


func _on_Rhino_pressed():
	pass # replace with function body
