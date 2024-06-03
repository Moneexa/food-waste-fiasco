extends Node
@onready var label = $Label


# Called when the node enters the scene tree for the first time.
func _ready():
	label.text="Has gastado $"+str(CartPrice.price)+" monedas"
	HungerQuestState.coins-=CartPrice.price


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_lets_go_cooking_pressed():
	var groceryAnalaysis=preload("res://spanishScenes/kidsScene/groceryAnalysis.tscn")
	get_tree().change_scene_to_packed(groceryAnalaysis)
