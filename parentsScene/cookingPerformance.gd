extends Node
@onready var texture_progress_bar = $TextureProgressBar
@onready var texture_rect_2 = $TextureRect2
@onready var title_1 = $Title1
@onready var meal_label = $Label2
@onready var title_bar = $Title1

@onready var label = $TextureProgressBar/Label

@onready var heading = $Label
var lang=LanguageScrnState.lang
var goodscore=""
var medscore=""
var badscpre=""
# Called when the node enters the scene tree for the first time.
func _ready():
	if lang=="en":
		heading.text="Analysis of your Kid's Meal Prepared"
		goodscore="The kid is a masterchef"
		medscore="The kid has a good kitchen observation"
		badscpre="Needs to participate in kitcheb"
		title_1="Know how of cooking sequence"
		meal_label.text="Preferred Meal"
		title_bar.text="Know-how of cooking sequence"
	elif lang=="es":
		heading.text="Análisis de la comida de su hijo preparada"
		goodscore="El niño es un masterchef"
		medscore="El niño tiene una buena observación en la cocina"
		badscpre="Necesita participar en kitcheb"
		title_1="Saber hacer la secuencia de cocción."
		meal_label.text="comida preferida"
		title_bar.text="Conocimientos de secuencia de cocción"
	elif lang=="dk":
		heading.text="Analyse af dit barns måltid forberedt"
		goodscore="Knægten er en mesterkok"
		medscore="Knægten har en god køkkenobservation"
		badscpre="Behøver at deltage i køkkenb"
		title_1="Vid, hvordan man laver sekvens"
		meal_label.text="Foretrukken måltid"
		title_bar.text="Know-how til madlavningssekvens"
	texture_progress_bar.value=CookingState.cookingScore
	if texture_progress_bar.value<50:
		label.text=badscpre
	elif texture_progress_bar.value>50 and texture_progress_bar.value<75:
		label.text=medscore
	elif texture_progress_bar.value>75:
		label.text=goodscore
	texture_rect_2.texture=load("res://thesisProjectAssets/dishesToPrep/"+CookingState.chosenDish+".PNG")	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_back_pressed():
	var menuScrn=preload("res://prentsScene/menuScene.tscn")
	get_tree().change_scene_to_packed(menuScrn)
