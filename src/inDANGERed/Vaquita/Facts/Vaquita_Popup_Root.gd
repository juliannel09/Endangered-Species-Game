extends Node

var one = "Vaquitas are the smallest of all the cetaceans, growing up to 5 feet in length and 120 pounds in weight"
var two = "They have the most limited range out of any cetaceans, staying only alongside the northern end of the Gulf of California"
var three = "They are facing habitat alterations due to the reduction of the freshwater that would usually flow in from the Colorado River"
var four = "The main threat they are facing is accidental entanglement in gillnet fisheries (as well as others) that cause them to die"
var five = "Vaquitas only give birth every other year"
var six = "The population is currently estimated to be less than 150 vaquitas"
var seven = "Because of the low population numbers it is thought that they can’t be stopped from becoming extinct due to interbreeding making them weaker and more susceptible to malformations"
var eight = "Vaquitas tend to live in groups of 3 animals, the largest group that they may be in is 8, but they tend to stay to a smaller group"
var nine = "Vaquitas use echolocation to figure out what is around it"
var ten = "They are carnivores and eat different types of fish, squid, and crustaceans"

var array = [one, two, three, four, five, six, seven, eight, nine, ten]
var changed = true

func _ready():
	set_process(true)

func _process(delta):
	var rand = int(rand_range(0, 10)) # Used to randomly pick the fact to display at the end
	if Globals.get("gameLevel") == false:
		if changed == false:
			get_node("PopupPanel/Facts_Label").set_text(array[rand])
			changed = true
	if Globals.get("gameLevel"):
		changed = false