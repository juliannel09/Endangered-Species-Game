extends ParallaxBackground

var offsetLoc = 0

func _ready():
	set_process(true)

func _process(delta):
	offsetLoc += 150*delta
	set_scroll_offset(Vector2(-offsetLoc, 0))