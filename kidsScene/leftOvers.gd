extends Node
@onready var comp_food_label = $TextureRect4/Label
@onready var recy_food_label = $TextureRect3/Label
@onready var left_over_food = $TextureRect2/TextureRect

@onready var food_destination_heading = $Label2
@onready var coinsNumber = $TextureRect9/Label
@onready var food_bowl = $TextureRect2
@onready var end = $Label
@onready var pause = $Label/TextureButton
@onready var compo = $TextureRect4
@onready var recy = $TextureRect3
@onready var dustbin_label = $TextureRect8/Label
@onready var fridge_label = $TextureRect7/Label
@onready var kitchen_label = $TextureRect6/Label
@onready var soil_label = $TextureRect5/Label
@onready var end_sorting_label = $Label
var destination_decision=""

var lang=LanguageScrnState.lang
func _ready():
	var remaining_food=EatingStates.remainingFood["remaining_food"]
	var come_here=""
	left_over_food.texture=load("res://thesisProjectAssets/dishesToPrep/"+CookingState.chosenDish+".PNG")
	if lang=="en":
		come_here="Come here and click me"
		end_sorting_label.text="End Sorting"
		destination_decision="Decide the destination, get there and touch it"
		comp_food_label.text="Used Vegetable/Fruit Peels, seeds, and Pulp"
		recy_food_label.text="Edible Fruits/Vegetable Peels"
	elif lang=="es":
		come_here="Ven aquí y haz clic en mí."
		end_sorting_label.text="Finalizar clasificación"		
		destination_decision="Decide el destino, llega y tócalo."			
		comp_food_label.text="Cáscaras, semillas y pulpa de frutas/verduras usadas"
		recy_food_label.text="Cáscaras de frutas/verduras comestibles"
	elif lang=="dk":
		come_here="Kom her og klik på mig."
		end_sorting_label.text="Afslut sortering"		
		destination_decision="Bestem destinationen, kom dertil og rør ved den"
		comp_food_label.text="Brugte grøntsagsfrugtskaller, frø og frugtkød"
		recy_food_label.text="Spiselige frugter/grøntsagsskræller"
	fridge_label.text=come_here
	kitchen_label.text=come_here
	soil_label.text=come_here
	dustbin_label.text=come_here

	
	if remaining_food==false:
		food_bowl.visible=false
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if lang=="en":
		coinsNumber.text=str(HungerQuestState.coins)+" coins"
	elif lang=="es":
		coinsNumber.text=str(HungerQuestState.coins)+" monedas"
	if lang=="dk":
		coinsNumber.text=str(HungerQuestState.coins)+" mønter"

	if food_bowl.visible==false and compo.visible==false and recy.visible==false:
		end.visible=true

func _on_food_pressed():
	LeftOversLocalStates.source_selected=str("0")
	food_destination_heading.text=destination_decision

func _on_compost_pressed():
	LeftOversLocalStates.source_selected=str("1")
	food_destination_heading.text=destination_decision
func _on_recycleable_pressed():
	LeftOversLocalStates.source_selected=str("2")
	food_destination_heading.text=destination_decision

func _on_main_menu_pressed():
	var leftOverState=LeftOversLocalStates.decision_list
	print("the decision list", leftOverState)
	var startScrn=preload("res://startScrn.tscn")
	get_tree().change_scene_to_packed(startScrn)
	
