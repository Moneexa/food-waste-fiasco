extends Node
@onready var texture_button = $TextureButton
@onready var texture_button_2 = $TextureButton2
@onready var texture_button_3 = $TextureButton3
@onready var badge = $VBoxContainer2/Label


@onready var coins = $VBoxContainer/Label

var lang=LanguageScrnState.lang
# Called when the node enters the scene tree for the first time.
func _ready():
	if lang=="en":
		coins.text=str(HungerQuestState.coins)+" coins"

	elif lang=="es":
		coins.text=str(HungerQuestState.coins)+" monedra"
	elif lang=="dk":
		coins.text=str(HungerQuestState.coins)+" mønter"	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(HungerQuestState.btnVisibility==true):
		texture_button.visible=true;
		texture_button_2.visible=true
		if lang=="en":
			texture_button.texture_normal=load("res://thesisProjectAssets/frdgeButton.PNG")
			texture_button_2.texture_normal=load("res://thesisProjectAssets/groceryBtn.PNG")
		elif lang=="es":
			texture_button.texture_normal=load("res://thesisProjectAssets/frdgeButton-es.png")
			texture_button_2.texture_normal=load("res://thesisProjectAssets/groceryBtn-es.PNG")
		elif lang=="dk":
			texture_button.texture_normal=load("res://thesisProjectAssets/frdgeButton-dk.png")
			texture_button_2.texture_normal=load("res://thesisProjectAssets/groceryBtn-dk.png")	
		HungerQuestState.btnVisibility=false
	if(FridgeScript.fridge_collided):
		texture_button_3.visible=true
		if lang=="en":
			texture_button_3.texture_normal=load("res://thesisProjectAssets/groceryBtn.PNG")
		elif lang=="es":
			texture_button_3.texture_normal=load("res://thesisProjectAssets/groceryBtn-es.PNG")
		elif lang=="dk":
			texture_button_3.texture_normal=load("res://thesisProjectAssets/groceryBtn-dk.png")				
@onready var area_2d = $Area2D


func _on_texture_button_pressed():
	texture_button.visible=false;
	texture_button_2.visible=false;
	area_2d.visible=true

	

var grocery=preload("res://kidsScene/grocery.tscn")
func _on_texture_button_3_pressed():
	get_tree().change_scene_to_packed(grocery)
	

