extends Node

@onready var label = $Label

var keyList=CookingState.recipes.keys()
var clickCounter=0
var showSteps=[]
var clicked_buttons=[]
var rightAnswers=0;
func generate_recipe():
	var ways={}
	for item in keyList:
		if item==CookingState.chosenDish:
			ways=CookingState.recipes[CookingState.chosenDish]
	showSteps=ways.values()
	var arr=showSteps.duplicate()
	arr.shuffle()
	return arr

		
@onready var v_box_container = $VBoxContainer

func populateBtn(recipeList):
	print("populate btn", recipeList)
	for item in recipeList:
		if item not in clicked_buttons:
			var btn = Button.new()
			btn.text=item
			btn.alignment=HORIZONTAL_ALIGNMENT_CENTER
			btn.size_flags_horizontal=Control.SIZE_SHRINK_BEGIN
			var newFont= FontFile.new()
			newFont.font_data=load("res://fonts/ShadowsIntoLight-Regular.ttf")
			btn.add_theme_font_override("font",newFont)
			btn.connect("pressed", Callable(self, "_on_recipe_pressed").bind(item, showSteps.find(item)))
			v_box_container.add_child(btn)
	CookingState.cookingScore=(float(rightAnswers)/float(recipeList.size()))*100.0				
	
# Called when the node enters the scene tree for the first time.
func _ready():
	label.text="Cocinemos"+CookingState.chosenDish
	var recipeList=generate_recipe()
	populateBtn(recipeList)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		coinsNumber.text=str(HungerQuestState.coins)+" monedas"
		
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var animated_sprite_2d_2 = $AnimatedSprite2D2
@onready var coinsNumber = $VBoxContainer2/Label
@onready var animated_sprite_2d_3 = $AnimatedSprite2D3
@onready var animated_sprite_2d_4 = $AnimatedSprite2D4

@onready var animated_sprite_2d_5 = $AnimatedSprite2D5
@onready var animated_sprite_2d_6 = $AnimatedSprite2D6
@onready var animated_sprite_2d_7 = $AnimatedSprite2D7
@onready var animated_sprite_2d_8 = $AnimatedSprite2D8

func _on_recipe_pressed(item, ind):
	if item not in clicked_buttons:
		clicked_buttons.append(item)
	print("step to remove", item)
	clickCounter+=1
	if(clickCounter==ind+1):
		animated_sprite_2d_7.visible=true
		rightAnswers+=1
		HungerQuestState.coins+=25

		await get_tree().create_timer(1.5).timeout
		animated_sprite_2d_7.visible=false

	var recipeList=generate_recipe()
	recipeList.remove_at(recipeList.find(item));
	var k1="dice"
	var k2="chop"
	var k3="peel"
	var k4="mix"
	var k5="boil"
	var k6="cook"
	var k7="soak"
	var k8="grind"
	var k9="shake"
	var k10="fry"
	if k1 in item or k2 in item:
		animated_sprite_2d_2.visible=false
		animated_sprite_2d.visible=true
		animated_sprite_2d_3.visible=false
		animated_sprite_2d_4.visible=false
		animated_sprite_2d_5.visible=false
		animated_sprite_2d_6.visible=false		
		animated_sprite_2d_8.visible=false
	elif k3 in item:
		animated_sprite_2d_2.visible=true
		animated_sprite_2d.visible=false
		animated_sprite_2d_3.visible=false
		animated_sprite_2d_4.visible=false	
		animated_sprite_2d_5.visible=false
		animated_sprite_2d_6.visible=false		
		animated_sprite_2d_8.visible=false
	elif k4 in item:

		animated_sprite_2d.visible=false
		animated_sprite_2d_2.visible=false
		animated_sprite_2d_3.visible=true
		animated_sprite_2d_4.visible=false		
		animated_sprite_2d_6.visible=false		
		animated_sprite_2d_8.visible=false
		await get_tree().create_timer(1.5).timeout
		animated_sprite_2d_5.visible=true
		animated_sprite_2d_3.visible=false		

	elif k5 in item or k6 in item or k10 in item:
		animated_sprite_2d_4.visible=true;			
		animated_sprite_2d.visible=false
		animated_sprite_2d_2.visible=false
		animated_sprite_2d_3.visible=false
		animated_sprite_2d_5.visible=false
		animated_sprite_2d_6.visible=false		
		animated_sprite_2d_8.visible=false
	elif k7 in item:
		animated_sprite_2d_6.visible=true
		animated_sprite_2d_4.visible=false;			
		animated_sprite_2d.visible=false
		animated_sprite_2d_2.visible=false
		animated_sprite_2d_3.visible=false
		animated_sprite_2d_5.visible=false		
		animated_sprite_2d_8.visible=false
	elif k8 in item or k9 in item:
		animated_sprite_2d_6.visible=false
		animated_sprite_2d_4.visible=false;			
		animated_sprite_2d.visible=false
		animated_sprite_2d_2.visible=false
		animated_sprite_2d_3.visible=false
		animated_sprite_2d_5.visible=false		
		animated_sprite_2d_8.visible=true
		
	print("recieeList after pressing button", recipeList)	
	for child in v_box_container.get_children():
		child.queue_free()
	populateBtn(recipeList)
	
	
	
	



func _on_end_coooking_pressed():
	var startScrn=load("res://kidsScene/eating.tscn")
	get_tree().change_scene_to_packed(startScrn)
