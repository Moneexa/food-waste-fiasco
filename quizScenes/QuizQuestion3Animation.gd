extends AnimatedSprite2D
@onready var label = $"../../Label"


# Called when the node enters the scene tree for the first time.
func _ready():
		self.frame=0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	var frame_count=self.sprite_frames.get_frame_count(self.animation)
	var curr_frame=self.frame
	if event.is_action_pressed("ui_right") and not event.is_echo():
		self.frame = (curr_frame + 1) % frame_count
		
		


func _on_q3_changed():
	if not self.visible:
		return
	var frame_count=self.sprite_frames.get_frame_count(self.animation)
	var curr_frame=self.frame
	if self.frame==frame_count-1:
		label.text="Pick answer from above options"
	else:
		label.text=">> Press the right key to see the full story"
	

	

