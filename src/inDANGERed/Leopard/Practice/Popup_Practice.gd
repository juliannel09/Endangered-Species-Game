extends Node

var one = "The only subspecies of leopard that is adapted to cold snowy climates"
var two = "It is estimated that there are less than 70 Amur Leopards left in the wild. 57 in Russia and 12 in China"
var three = "In the summer their coats are about 2.5 cm long, in the winter their coat grows to 7 cm long"
var four = "Endangered due mainly to habitat loss. Their forests are often cut down for timber, new farmlands, coal mining, oil pipelines, and new roads"
var five = "They get their name from the Amur River, the area they inhabit"
var six = "Live for 10-15 years in the wild and up to 20 years in captivity"
var seven = "Can run up to 35 mph"
var eight = "There are more Amur leopards living in zoos than in the wild"
var nine = "Hunt at night and hide unfinished prey (sometimes in trees)"
var ten = "Can leap more than 20 feet horizontally and up to 10 feet vertically"
var array = [one, two, three, four, five, six, seven, eight, nine, ten]

var changed = true

func _ready():
	set_process(true)

func _process(delta):
	var rand = int(rand_range(0, 10)) # Used to randomly pick the fact to display at the end
	if Globals.get("gameLevel") == false:
		if changed == false:
			get_node("PopupPanel/Label_Facts").set_text(array[rand])
			changed = true
	else:
		changed = false
		