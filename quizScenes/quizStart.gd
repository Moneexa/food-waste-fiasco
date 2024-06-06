extends Node
const quizScreen= preload("res://quizScenes/quizQuestionsScreens.tscn")
@onready var label = $Label
@onready var button = $Button
@onready var button_2 = $Button2


# Called when the node enters the scene tree for the first time.
func _ready():
	var lang=LanguageScrnState.lang
	if lang=="en":
		label.text="Voil! You found a  Mystical Quiz in the chest"
		button.texture_normal=load("res://thesisProjectAssets/Start_Quiz.png")
		button_2.texture_normal=load("res://thesisProjectAssets/checkTutorial.PNG")
	elif lang=="es":
		label.text="¡Vaya! Encontraste un cuestionario místico en el cofre."	
		button.texture_normal=load("res://thesisProjectAssets/Start_Quiz-es.png")
		button_2.texture_normal=load("res://thesisProjectAssets/checkTutorial-es.png")
	elif lang=="dk":
		label.text="Voil! Du fandt en mystisk quiz i brystet"
		button.texture_normal=load("res://thesisProjectAssets/Start_Quiz.png")
		button_2.texture_normal=load("res://thesisProjectAssets/checkTutorial-dk.png")
			

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_pressed():
	get_tree().change_scene_to_packed(quizScreen)


func _on_button_2_pressed():
	var quizTurotial=preload("res://spanishScenes/kidsScene/quizTutorial.tscn")
	get_tree().change_scene_to_packed(quizTurotial)
