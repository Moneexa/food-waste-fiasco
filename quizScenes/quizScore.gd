extends Node


@onready var label = $Score

@onready var resut_text = $Remarks
@onready var reward_box = $RewardBox

@onready var label_4 = $Comments

@onready var button = $Button
var hungerQuest=preload("res://spanishScenes/kidsScene/hungerQuest.tscn")
@onready var texture_button = $TextureButton
@onready var character_body_2d = $CharacterBody2D
var startScrn=preload("res://spanishScenes/main-es.tscn")



# Called when the node enters the scene tree for the first time.

func load_result(score):
	if(score<3):
		resut_text.text="Intentar otra vez"
	elif(score>=3):
		resut_text.text="Toca tu regalo a continuación"
		reward_box.visible=true

	
func _ready():
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
	if QuizScore.score>=3:
		label_4.text="Felicitaciones, se ha ganado una insignia de diamantes."
		character_body_2d.visible=true
		button.visible=true



func _on_try_again_pressed():
	get_tree().change_scene_to_packed(startScrn)

