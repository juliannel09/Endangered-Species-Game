extends Label

var one = "The only subspecies of leopard that is adapted to cold snowy climates"
var two = "It is estimated that there are less than 70 Amur Leopards left in the wild. 57 in Russia and 12 in China"
var three = "In the summer their coats are about 2.5 cm long, in the winter their coat grows to 7 cm long"

func _ready():
	pass

func set_text():
	var rand = rand_range(0, 3)
	if rand <= 1:
		get_node(".").set_text(one)
	elif rand <= 2:
		get_node(".").set_text(two)
	else:
		get_node(".").set_text(three)
