extends Node
@onready var food_eaten = $TextureProgressBar2
@onready var label = $TextureProgressBar2/Label
@onready var hungersatisfied = $TextureProgressBar
@onready var hungerperc = $TextureProgressBar/Label

var foodWeight=0

# Called when the node enters the scene tree for the first time.
func _ready():
		for item in Grocery.groceryList:
			if item!={}:
				foodWeight+=item.weight;
		var remainingFood=EatingStates.remainingFood
		if remainingFood["amount"]==0:
			food_eaten.value=100
			label.text="Food Completely Finished"
		else:
			var val=int(100-((remainingFood["amount"]/foodWeight)*100))
			food_eaten.value=val
			label.text="Food Eaten:  "+str(val)+"%"
		hungersatisfied.value=EatingStates.percentageOfHungerSatisified
		if hungersatisfied.value<=33:
			hungerperc.text="33% hunger fulfilled:  still hungry"
		elif hungersatisfied.value<=66:
			hungerperc.text="66% hunger fulfilled:  half hungry"
		elif hungersatisfied.value<=100:
			hungerperc.text="Much hunger fulfilled:  stomach full"													


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_texture_button_pressed():
	var menuScrn=preload("res://prentsScene/menuScene.tscn")
	get_tree().change_scene_to_packed(menuScrn)
