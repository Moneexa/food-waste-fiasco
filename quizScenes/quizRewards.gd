extends Popup

@onready var label = $VBoxContainer/Score
@onready var resut_text = $VBoxContainer/Remarks
@onready var texture_rect = $VBoxContainer/RewardBox
@onready var label_4 = $VBoxContainer/Comments
@onready var center_container = $VBoxContainer/CenterContainer

var diamond = preload("res://quizScenes/twinkling_diamond.tscn")
# Called when the node enters the scene tree for the first time.

func load_result(score):
	if(score<3):
		resut_text.text="Try Again"
		texture_rect.texture=load("res://thesisProjectAssets/tryAgain-removebg-preview.png")
	elif(score>=3):
		resut_text.text="Tap Your Gift Below"
		texture_rect.texture=load("res://thesisProjectAssets/gift-removebg-preview.png")		
	
func _ready():
	label.text=str((QuizScore.score/5)*100)+"%"
	load_result(QuizScore.score)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_reward_box_mouse_entered():
	if QuizScore.score>=3:
		label_4.text="Congratulations you have earned a diamond badge"
		var diamondbadgeInst=diamond.instantiate()
		center_container.add_child(diamondbadgeInst)


