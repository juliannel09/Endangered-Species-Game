extends AnimatedSprite

var timeElapsed = 0

func _ready():
	set_process(true)
	
func _process(delta):
	timeElapsed += delta
	if(timeElapsed > 1.2):
		if(get_frame() == self.get_sprite_frames().get_frame_count("default") - 1):
			set_frame(0)
		else:
			self.set_frame(get_frame() + 1)
		
		timeElapsed = 0