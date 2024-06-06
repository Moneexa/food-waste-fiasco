extends Node
@onready var label = $Label
@onready var cooking = $TextureButton

var lang=LanguageScrnState.lang
# Called when the node enters the scene tree for the first time.
func _ready():
	if lang=="en":
		label.text="You have spent $"+str(CartPrice.price)+" coins"
		cooking.texture_normal=load("res://thesisProjectAssets/letsGoCooking.PNG")
	elif lang=="es":
		label.text="has gastado $"+str(CartPrice.price)+" monedas"
		cooking.texture_normal=load("res://thesisProjectAssets/letsGoCooking-es.PNG")
	elif lang=="dk":
		label.text="Du har brugt $"+str(CartPrice.price)+" monetr"	
		cooking.texture_normal=load("res://thesisProjectAssets/letsGoCooking-dk.PNG")		
	HungerQuestState.coins-=CartPrice.price


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_lets_go_cooking_pressed():
	var groceryAnalaysis=preload("res://kidsScene/groceryAnalysis.tscn")
	get_tree().change_scene_to_packed(groceryAnalaysis)
