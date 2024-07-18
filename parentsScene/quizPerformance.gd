extends Control
@onready var texture_progress_bar = $TextureProgressBar
@onready var texture_progress_bar_2 = $TextureProgressBar2
@onready var texture_progress_bar_3 = $TextureProgressBar3
@onready var texture_progress_bar_4 = $TextureProgressBar4
@onready var texture_progress_bar_5 = $TextureProgressBar5
@onready var remarks2 = $Label2/Remarks
@onready var remarks4 = $Label4/Remarks
@onready var remarks5 = $Label5/Remarks
@onready var remarks3 = $Label3/Remarks
@onready var remarks1 = $Label/Remarks
@onready var heading = $Label6
@onready var q1 = $Label
@onready var q2 = $Label2
@onready var q3 = $Label3
@onready var q4 = $Label4
@onready var q5 = $Label5

var lang=LanguageScrnState.lang
var good_appreciation=""
var bad_appreciation=""

# Called when the node enters the scene tree for the first time.
func _ready():
	if lang=="en":
		heading.text="Overall analysis of your child's attitude towards Food"
		good_appreciation="Good Job"
		bad_appreciation="Needs Improvement"
		q1.text="Control on blatant purchasing"
		q2.text="Know-how of expired items"
		q3.text="Awareness of over cooking"
		q4.text="Knowledge of proper food storage"
		q5.text="Know-how of Food reusability"
		
	elif lang=="es":
		heading.text="Análisis general de la actitud de su hijo hacia la comida"
		good_appreciation="Buen trabajo"
		bad_appreciation="Necesita mejorar"
		q1.text="Control de compras descaradas"
		q2.text="Know-how de artículos caducados"
		q3.text="Conciencia de cocinar demasiado"
		q4.text="Conocimiento del almacenamiento adecuado de alimentos."
		q5.text="Know-how de reutilización de alimentos"
	elif lang=="dk":
		heading.text="Overordnet analyse af dit barns holdning til mad"
		good_appreciation="Godt arbejde"
		bad_appreciation="Har behov for forbedring"
		q1.text="Kontrol med åbenlyse køb"
		q2.text="Know-how om udløbne varer"
		q3.text="Bevidsthed om overkogning"
		q4.text="Kendskab til korrekt opbevaring af fødevarer"
		q5.text="Know-how om genanvendelighed af fødevarer"
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var obj=QuizAnswers.quizQuestions
	if obj["overpurchasing"]==0:
			texture_progress_bar.value=50;
			remarks1.text=bad_appreciation
	elif obj["overpurchasing"]==1:
			texture_progress_bar.value=100;
			remarks1.text=good_appreciation			
	if obj["expiredItems"]==0:
			texture_progress_bar_2.value=50;
			remarks2.text=bad_appreciation
	elif obj["expiredItems"]==1:
			texture_progress_bar_2.value=100;
			remarks2.text=good_appreciation
	if obj["overcooking"]==0:
			texture_progress_bar_3.value=50;
			remarks3.text=bad_appreciation
	elif obj["overcooking"]==1:
			texture_progress_bar_3.value=100;
			remarks3.text=good_appreciation
	if obj["foodStorage"]==0:
			texture_progress_bar_4.value=50;
			remarks4.text=bad_appreciation
	elif obj["foodStorage"]==1:
			texture_progress_bar_4.value=100;
			remarks4.text=good_appreciation
	if obj["recycleFood"]==0:
			remarks5.text=bad_appreciation
			texture_progress_bar_5.value=50
	elif obj["recycleFood"]==1:
			texture_progress_bar_5.value=100
			remarks5.text=good_appreciation		
			
				
			
		

		
		


func _on_back_button_pressed():
	var menuScene=preload("res://prentsScene/menuScene.tscn")
	get_tree().change_scene_to_packed(menuScene)
