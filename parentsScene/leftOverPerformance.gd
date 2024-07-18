extends Node
@onready var food_bowl = $TextureRect2
@onready var heading = $Label
@onready var Remarks = $Label2

@onready var food_remark = $TextureRect5/Label
@onready var recy_remarj = $TextureRect6/Label

@onready var comp_remark = $TextureRect7/Label


@onready var food_disp = $TextureRect5
@onready var comp_disp = $TextureRect6
@onready var recy_disp = $TextureRect7
@onready var food_weight = $TextureRect2/Label
@onready var food = $TextureRect2/Label
@onready var rec = $TextureRect3/Label
@onready var comp = $TextureRect4/Label

var menuScrn=preload("res://prentsScene/menuScene.tscn")

var lang=LanguageScrnState.lang
# Called when the node enters the scene tree for the first time.
func _ready():

	if lang=="en":
		heading.text="Items Sorted by your child"
		food.text="Remaining Food: "
		rec.text="Used Vegetable/Fruits Seeds and Pulp"
		comp.text="Edible Fruits/Vegetables"
	elif lang=="es":
		heading.text="Artículos ordenados por su hijo"
		food.text="Comida restante:"
		rec.text="Semillas y pulpa de frutas y verduras usadas"
		comp.text="Frutas/verduras comestibles"
	elif lang=="dk":
		heading.text="Varer sorteret efter dit barn"
		food.text="Resterende mad: "
		rec.text="Brugt grøntsags-/frugtfrø og frugtkød"
		comp.text="Spiselige frugter/grøntsager"
	var food=EatingStates.remainingFood
	if food["remaining_food"]==false:
		food_bowl.visible=false;
		food_weight.visible=false;
	else:
		var food_wt=""
		if food["amount"]>=1000:
			var wt=food["amount"]/1000
			food_wt=str(int(wt))+" kg"
		else:
			food_wt=str(food["amount"])+" grams"
		if lang=="en":
			food_weight.text=" Remaining Food: "+food_wt
		elif lang=="es":
			food_weight.text=" Comida restante: "+food_wt
		elif lang=="dk":
			food_weight.text=" Resterende mad: "+food_wt						
	var decision_list= LeftOversLocalStates.decision_list
	if decision_list==[{"source":"0", "destination":"fridge"},{"source":"1", "destination":"soil"},{"source":"2", "destination":"kitchen"}]:
		if lang=="en":
			Remarks.text="Your Kid knows where to place the items"
		elif lang=="es":
			Remarks.text="Su hijo sabe dónde colocar los artículos"
		elif lang=="dk":
			Remarks.text="Dit barn ved, hvor tingene skal placeres"	
	else:
		if lang=="en":
				Remarks.text="Your child needs to learn where to put leftovers."
		elif lang=="es":
			Remarks.text="Tu hijo necesita aprender dónde colocar las sobras."
		elif lang=="dk":
			Remarks.text="Dit barn skal lære, hvor det skal placeres resterne"
		for item in decision_list:
			if item.source=="0" and item.destination!="fridge":
				
				if lang=="en":
					food_remark.text="It should have been stored inside fridge"
				elif lang=="es":
					food_remark.text="debería haber sido nevera"
				elif lang=="dk":
					food_remark.text="Det skulle have været køleskab"
			if item.source=="1" and item.destination!="soil":
				if lang=="en":
					comp_remark.text="It should have been composted in soil"
				elif lang=="es":
					comp_remark.text="Debería haber sido compostado en el suelo."
				elif lang=="dk":
					comp_remark.text="Det skulle have været komposteret i jord"
			if item.source=="2" and item.destination!="kitchen":
				if lang=="en":
					recy_remarj.text="It should have been reused in kitchen"
				elif lang=="es":
					recy_remarj.text="debería haber sido reutilizado"
				elif lang=="dk":
					recy_remarj.text="Det skulle have været genbrugt"
					
		
	var food_pic=load("")
	var recy_pic=load("")
	var comp_pic=load("")
	for item in decision_list:
		if item!={}:
			if item.source=="0":
				food_pic=return_texture(item.destination)
			elif item.source=="1":
				recy_pic=return_texture(item.destination)
			elif item.source=="2":
				comp_pic=return_texture(item.destination)				
	food_disp.texture=food_pic
	recy_disp.texture=recy_pic
	comp_disp.texture=comp_pic		
				
func return_texture(destination):
	var src=load("")
	if destination=="soil":
				src=load("res://thesisProjectAssets/foodConsumption/soil.PNG")
	elif destination=="fridge":
				src=load("res://thesisProjectAssets/foodConsumption/fridge.PNG")
	elif destination=="kitchen":
				src=load("res://thesisProjectAssets/foodConsumption/kitchen.PNG")
	else:
				src=load("res://thesisProjectAssets/foodConsumption/dustbin.PNG")
	return src

				

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var dec=LeftOversLocalStates.decision_list
	print(dec)


func _on_back_pressed():
	get_tree().change_scene_to_packed(menuScrn)
