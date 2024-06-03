extends Node
@onready var texture_button = $TextureButton
@onready var texture_button_2 = $TextureButton2

@onready var texture_button_3 = $TextureButton3
@onready var coins = $VBoxContainer/Label

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	coins.text=str(HungerQuestState.coins)+" coins"
	if(HungerQuestState.btnVisibility==true):
		texture_button.visible=true;
		texture_button_2.visible=true
		HungerQuestState.btnVisibility=false
	if(FridgeScript.fridge_collided):
		texture_button_3.visible=true
			
@onready var area_2d = $Area2D


func _on_texture_button_pressed():
	texture_button.visible=false;
	texture_button_2.visible=false;
	area_2d.visible=true

	

var grocery=preload("res://spanishScenes/kidsScene/grocery.tscn")
func _on_texture_button_3_pressed():
	get_tree().change_scene_to_packed(grocery)
	

