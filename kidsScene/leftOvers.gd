extends Node

@onready var food_destination_heading = $Label2
@onready var coinsNumber = $TextureRect9/Label
@onready var food_bowl = $TextureRect2
@onready var end = $Label
@onready var pause = $Label/TextureButton
@onready var compo = $TextureRect4
@onready var recy = $TextureRect3


func _ready():
	var remaining_food=EatingStates.remainingFood["remaining_food"]
	if remaining_food==false:
		food_bowl.visible=false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	coinsNumber.text=str(HungerQuestState.coins)+" monedas"
	if food_bowl.visible==false and compo.visible==false and recy.visible==false:
		end.visible=true

func _on_food_pressed():
	LeftOversLocalStates.source_selected=str("0")
	food_destination_heading.text="Decide el destino, llega hasta allí y tócalo."


func _on_compost_pressed():
	LeftOversLocalStates.source_selected=str("1")
	food_destination_heading.text="Decide el destino, llega hasta allí y tócalo."

func _on_recycleable_pressed():
	LeftOversLocalStates.source_selected=str("2")
	food_destination_heading.text="Decide el destino, llega hasta allí y tócalo."

func _on_main_menu_pressed():
	var leftOverState=LeftOversLocalStates.decision_list
	print("the decision list", leftOverState)
	var startScrn=preload("res://startScrn.tscn")
	get_tree().change_scene_to_packed(startScrn)
	
