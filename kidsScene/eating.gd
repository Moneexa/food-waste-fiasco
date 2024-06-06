extends Node
@onready var energy_label = $VBoxContainer/Label
@onready var hunger_label = $VBoxContainer2/Label
@onready var sorting_left = $TextureButton3

@onready var sprite_2d = $Sprite2D
@onready var texture_button_2 = $TextureButton2
@onready var texture_button = $TextureButton
@onready var texture_rect2 = $VBoxContainer2/TextureRect
@onready var texture_rect = $VBoxContainer/TextureRect
@onready var foodWeightLabel = $Label
@onready var molassWeight = $Label2
@onready var remainingFoodLeft = $Label3
var remainingFood=0
var lang=LanguageScrnState.lang
@onready var sprite_2d_2 = $Sprite2D2
var foodWeight=3
var molasses=0
var incremented=false
var percentageOfHunger=0
@onready var dish_pic = $TextureRect2

# Called when the node enters the scene tree for the first time.
func _ready():
	for item in Grocery.groceryList:
		if item!={}:
			foodWeight+=item.weight;
	print("**************food weight**********", foodWeight)
	dish_pic.texture=load("res://thesisProjectAssets/dishesToPrep/"+CookingState.chosenDish+".PNG")
	var food_weight_string=""
	if lang=="en":
		food_weight_string="Let's see if you would be able to complete the "
		energy_label.text="Energy Bar"
		hunger_label.text="Hunger Bar"
		texture_button.texture_normal=load("res://thesisProjectAssets/foodConsumption/startEating.PNG")
		texture_button_2.texture_normal=load("res://thesisProjectAssets/foodConsumption/pauseEating.PNG")
		sorting_left.texture_normal=load("res://thesisProjectAssets/foodConsumption/dealWithLeft.PNG")
	elif lang=="es":
		food_weight_string="Veamos si serías capaz de completar el  "	
		energy_label.text="Barra de energía"
		hunger_label.text="Barra del hambre"
		texture_button.texture_normal=load("res://thesisProjectAssets/foodConsumption/startEating-es.PNG")
		texture_button_2.texture_normal=load("res://thesisProjectAssets/foodConsumption/pauseEating-es.png")
		sorting_left.texture_normal=load("res://thesisProjectAssets/foodConsumption/dealWithLeft-es.png")
	elif lang=="dk":
		food_weight_string="Lad os se, om du ville være i stand til at fuldføre  "	
		energy_label.text="Energibar"
		hunger_label.text="Sult bar"
		texture_button.texture_normal=load("res://thesisProjectAssets/foodConsumption/startEating-dk.PNG")
		texture_button_2.texture_normal=load("res://thesisProjectAssets/foodConsumption/pauseEating-dk.png")
		sorting_left.texture_normal=load("res://thesisProjectAssets/foodConsumption/dealWithLeft-dk.png")
	if foodWeight>=1000:
			foodWeightLabel.text=food_weight_string+str(foodWeight/1000)+"  kg of food"
	else:
			foodWeightLabel.text=food_weight_string+str(foodWeight)+"  grams of food"		
	remainingFood=foodWeight		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var spr = $Sprite2D.frame
	print(spr)
	if (spr == 1 or spr == 4) and remainingFood > 0:
		if not incremented:
			molasses += 1
			remainingFood -= (remainingFood * 0.0833)
			var remaining_food_text=""
			var bites_eaten_text=""
			if lang=="en":
				remaining_food_text="Remaining Food:   "
				bites_eaten_text="Bites eaten:   "
			elif lang=="es":
				remaining_food_text="Comida restante:   "
				bites_eaten_text="Bocados comidos:   "
			elif lang=="dk":
				remaining_food_text="Resterende mad:   "
				bites_eaten_text="Bites spist:   "

			remainingFoodLeft.text = remaining_food_text+ str(int(remainingFood)) +"  grams"
			molassWeight.text = bites_eaten_text+ str(molasses)
			incremented = true
	else:
		incremented = false
	print("Molasses:", molasses, "Remaining Food", remainingFood)
	if remainingFood <= foodWeight / 2 and remainingFood > foodWeight / 4:
		sprite_2d_2.texture = load("res://thesisProjectAssets/foodConsumption/hungryspiritEatingFood2.png")
		percentageOfHunger=33
	elif remainingFood <= foodWeight / 4 and remainingFood > foodWeight / 6:
		sprite_2d_2.texture = load("res://thesisProjectAssets/foodConsumption/hungryspiritEatingFood3.png")
		texture_rect.texture = load("res://thesisProjectAssets/Speedometer3.png")
		texture_rect2.texture = load("res://thesisProjectAssets/Speedometer3.png")
		percentageOfHunger=66
	elif remainingFood <= foodWeight / 6 and remainingFood > 0:
		if lang=="en":
			sprite_2d_2.texture = load("res://thesisProjectAssets/foodConsumption/hungryspiritEatingFood4.png")
		if lang=="es":
			sprite_2d_2.texture = load("res://thesisProjectAssets/foodConsumption/hungryspiritEatingFood4-es.png")			
		elif lang=="dk":
			sprite_2d_2.texture = load("res://thesisProjectAssets/foodConsumption/hungryspiritEatingFood4-dk.png")
		texture_rect.texture = load("res://thesisProjectAssets/Speedometer1.png")
		texture_rect2.texture = load("res://thesisProjectAssets/Speedometer2.png")
		percentageOfHunger=100
	print("incremented", incremented)
	print("remaining Food", remainingFood)	
	if int(remainingFood) <= 0 and incremented:
		remainingFood = 0  # Ensure remainingFood does not go below 0
		sprite_2d.play("finish_eating")
		dish_pic.visible=false
func _on_start_pressed():
	sprite_2d.play("eating")
	EatingStates.morsels=molasses
	texture_button_2.visible=true
	texture_button.visible=false

func _on_pause_pressed():
	sprite_2d.play("default")
	EatingStates.morsels=molasses
	EatingStates.percentageOfHungerSatisified=percentageOfHunger
	EatingStates.remainingFood=remainingFood

	texture_button.visible=true
	texture_button_2.visible=false


func _on_texture_button_3_pressed():
	var puzzle=preload("res://kidsScene/leftOvers.tscn")
	EatingStates.morsels=molasses
	EatingStates.percentageOfHungerSatisified=percentageOfHunger
	if remainingFood==0:
		EatingStates.remainingFood={"remaining_food":false, "amount":0}
	else:
		EatingStates.remainingFood={"remaining_food":true, "amount":remainingFood}
	get_tree().change_scene_to_packed(puzzle)
