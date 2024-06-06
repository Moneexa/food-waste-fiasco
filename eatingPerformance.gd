extends Node
@onready var food_eaten = $TextureProgressBar2
@onready var label = $TextureProgressBar2/Label
@onready var hungersatisfied = $TextureProgressBar
@onready var hungerperc = $TextureProgressBar/Label
@onready var heading = $Label
@onready var hungry = $Label2
@onready var food_rem = $Label3

var foodWeight=0
var lang=LanguageScrnState.lang
# Called when the node enters the scene tree for the first time.
func _ready():
	if lang=="en":
		heading.text="An insight into the Food Consumption"
		hungry.text="Percent of Hunger Satisified"
		food_rem.text="Food Eaten"
	elif lang=="es":
		heading.text="Una mirada al consumo de alimentos"
		hungry.text="Porcentaje de personas satisfechas con el hambre"
		food_rem.text="comida consumida"
	elif lang=="dk":
		heading.text="Et indblik i fødevareforbruget"
		hungry.text="Procent af sult tilfreds"
		food_rem.text="Spist mad"
	for item in Grocery.groceryList:
			if item!={}:
				foodWeight+=item.weight;
	var remainingFood=EatingStates.remainingFood
	if remainingFood["amount"]==0:
			food_eaten.value=100
			if lang=="en":
				label.text="Food Completely Finished"
			elif lang=="es":
				label.text="Comida completamente terminada"
			elif lang=="dk":
				label.text="Maden er helt færdig"
	else:
			var val=int(100-((remainingFood["amount"]/foodWeight)*100))
			food_eaten.value=val
			if lang=="en":
				label.text="Food Eaten:  "+str(val)+"%"
			elif lang=="es":
				label.text="Comida Consumida: "+str(val)+"%"
			elif lang=="dk":
				label.text="Mad spist: "+str(val)+"%"

	hungersatisfied.value=EatingStates.percentageOfHungerSatisified
	if hungersatisfied.value<=33:
		if lang=="en":
			hungerperc.text="Less than half:33% hunger fulfilled:  still hungry"
		elif lang=="es":
			hungerperc.text="Menos de la mitad del:33% hambre satisfecha: todavía tenemos hambre"
		elif lang=="dk":
			hungerperc.text="Mindre end halv: 33% sult opfyldt: stadig sulten"

	elif hungersatisfied.value<=66:
		if lang=="en":
			hungerperc.text="66% hunger fulfilled:  half hungry"
		elif lang=="es":
			hungerperc.text="66% del hambre satisfecha: media hambre"
		elif lang=="dk":
			hungerperc.text="66 % sult opfyldt: halvt sulten"

	elif hungersatisfied.value<=100:
		if lang=="en":	
			hungerperc.text="Much hunger fulfilled:  stomach full"
		elif lang=="es":
			hungerperc.text="Mucha hambre satisfecha: estómago lleno"
		elif lang=="dk":
			hungerperc.text="Meget sult opfyldt: maven fuld"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_texture_button_pressed():
	var menuScrn=preload("res://prentsScene/menuScene.tscn")
	get_tree().change_scene_to_packed(menuScrn)
