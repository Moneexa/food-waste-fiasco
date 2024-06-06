extends Node
@onready var your_score = $YourScore


@onready var label = $Score

@onready var resut_text = $Remarks
@onready var reward_box = $RewardBox

@onready var label_4 = $Comments

@onready var button = $Button
var hungerQuest=preload("res://kidsScene/hungerQuest.tscn")
@onready var texture_button = $TextureButton
@onready var character_body_2d = $CharacterBody2D
var startScrn=preload("res://thesisProjectAssets/main.tscn")

var lang=LanguageScrnState.lang

# Called when the node enters the scene tree for the first time.

func load_result(score):
	if(score<3):
		if lang=="en":
			resut_text.text="Try again"

		elif lang=="es":
			resut_text.text="Intentar otra vez"		

		elif lang=="dk":
			resut_text.text="Prøv igen"

	elif(score>=3):
		if lang=="en":
			resut_text.text="Tap your gift below"
			button.text="Lets go to next challenge"
		elif lang=="es":
			resut_text.text="Toca tu regalo a continuación"
			button.text="Vamos al siguiente desafío."
		elif lang=="dk":
			resut_text.text="Tryk på din gave nedenfor"
			button.text="Lad os gå til næste udfordring"		
		reward_box.visible=true

	
func _ready():
	if lang=="en":
			your_score.text="Your Score"
	elif lang=="es":
			your_score.text="Tu puntuación"		
	elif lang=="dk":
			your_score.text="Din score"	

	if(QuizScore.score<3):
		texture_button.visible=true
	label.text=str(float(QuizScore.score/5.0)*100.0)+"%"
	load_result(QuizScore.score)

	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



		

func _on_button_pressed():
	print("came in buttons")
	get_tree().change_scene_to_packed(hungerQuest)



func _on_reward_box_pressed():
	if lang=="en":
			label_4.text="Congratulations, you have earned a diamond badge."
	elif lang=="es":
			label_4.text="Felicitaciones, se ha ganado una insignia de diamantes."
	elif lang=="dk":
		label_4.text="Tillykke, du har fået et diamantmærke."		
	character_body_2d.visible=true
	button.visible=true



func _on_try_again_pressed():
	get_tree().change_scene_to_packed(startScrn)

