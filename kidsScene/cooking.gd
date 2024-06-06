extends Node

@onready var label = $Label
@onready var heading = $Label2

var keyList=CookingState.recipes_en.keys()
	
var clickCounter=0
var showSteps=[]
var clicked_buttons=[]
var rightAnswers=0;
var lang=LanguageScrnState.lang
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var animated_sprite_2d_2 = $AnimatedSprite2D2
@onready var coinsNumber = $VBoxContainer2/Label
@onready var animated_sprite_2d_3 = $AnimatedSprite2D3
@onready var animated_sprite_2d_4 = $AnimatedSprite2D4
@onready var serving_anim = $AnimatedSprite2D9

@onready var animated_sprite_2d_5 = $AnimatedSprite2D5
@onready var animated_sprite_2d_6 = $AnimatedSprite2D6
@onready var animated_sprite_2d_7 = $AnimatedSprite2D7
@onready var animated_sprite_2d_8 = $AnimatedSprite2D8
@onready var dish_pic_2 = $TextureRect2
@onready var v_box_container = $VBoxContainer
@onready var dish_pic = $Label/TextureRect
var last_anim=false
func generate_recipe():
	var ways={}
	for item in keyList:
		if item==CookingState.chosenDish:
			if lang=="en":
				ways=CookingState.recipes_en[CookingState.chosenDish]
			elif lang=="es":
				ways=CookingState.recipes_es[CookingState.chosenDish]
			elif lang=="dk":
				ways=CookingState.recipes_dk[CookingState.chosenDish]

	showSteps=ways.values()
	var arr=showSteps.duplicate()
	arr.shuffle()
	return arr

		


func populateBtn(recipeList):
	print("populate btn", recipeList)
	for item in recipeList:
		if item not in clicked_buttons:
			var btn = Button.new()
			var stylebox_clicked = StyleBoxFlat.new()
			stylebox_clicked.bg_color = Color("blue") # Red color for normal state
			var stylebox_normal = StyleBoxFlat.new()
			stylebox_normal.bg_color = Color("green") # Green color for hover state
			var stylebx_hover = StyleBoxFlat.new()
			stylebx_hover.bg_color = Color("orange") # Red color for normal state

			btn.text=item
			btn.alignment=HORIZONTAL_ALIGNMENT_CENTER
			btn.size_flags_horizontal=Control.SIZE_SHRINK_BEGIN
			var newFont= FontFile.new()
			newFont.font_data=load("res://fonts/ShadowsIntoLight-Regular.ttf")
			btn.add_theme_font_override("font",newFont)
			btn.add_theme_color_override("font_color", Color("black"))
			btn.add_theme_font_size_override("font_size", 20)
			btn.add_theme_stylebox_override("normal", stylebox_normal)
			btn.add_theme_stylebox_override("pressed", stylebox_clicked)
			btn.add_theme_stylebox_override("hover", stylebx_hover)
			
			btn.connect("pressed", Callable(self, "_on_recipe_pressed").bind(item, showSteps.find(item)))
			v_box_container.add_child(btn)
	CookingState.cookingScore=(float(rightAnswers)/float(recipeList.size()))*100.0				



# Called when the node enters the scene tree for the first time.
func _ready():
	dish_pic.texture=load("res://thesisProjectAssets/dishesToPrep/"+CookingState.chosenDish+".PNG")
	dish_pic_2.texture=load("res://thesisProjectAssets/dishesToPrep/"+CookingState.chosenDish+".PNG")
	if lang=="en":
		label.text="Lets Cook "
		heading.text="Choose from the steps correctly, what should be done."
	elif lang=="es":		
		label.text="Cocinemos "
		heading.text="Elija entre los pasos correctamente lo que se debe hacer"
	elif lang=="dk":		
		label.text="Lad os lave mad "
		heading.text="Vælg fra trinene korrekt, hvad der skal gøres"

	var recipeList=generate_recipe()
	populateBtn(recipeList)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if lang=="en":
		coinsNumber.text=str(HungerQuestState.coins)+" coins"
	elif lang=="es":
		coinsNumber.text=str(HungerQuestState.coins)+" monedas"	
	elif lang=="dk":
		coinsNumber.text=str(HungerQuestState.coins)+" mønter"		
	var count=v_box_container.get_child_count(true)
	if count<1:
		if animated_sprite_2d_5.visible==false:
			await get_tree().create_timer(0.5).timeout
			serving_anim.visible=true;
			animated_sprite_2d_2.visible=false
			animated_sprite_2d.visible=false
			animated_sprite_2d_3.visible=false
			animated_sprite_2d_4.visible=false
			animated_sprite_2d_5.visible=false
			animated_sprite_2d_6.visible=false
			animated_sprite_2d_8.visible=false
			dish_pic_2.visible=true

		

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
	enable_animations(item)
	print("recieeList after pressing button", recipeList)	
	for child in v_box_container.get_children():
		child.queue_free()
	populateBtn(recipeList)
						
		
		
	
func enable_animations(item):
		var actions_en = {
			"k1": "dice","k2": "chop",
			"k3": "peel","k4": "mix", "k5": "boil","k6": "cook",
			"k7": "soak","k8": "grind","k9": "shake","k10": "fry",
			"k11":"bake","k12":"sprinkle"
		}
		var actions_es = {
			"k1": "dados","k2": "picar",
			"k3": "pelar","k4": "mezclar",
			"k5": "hervir","k6": "cocinar",
			"k7": "remojar","k8": "moler",
			"k9": "agitar","k10": "freír",
			"k11":"hornear","k12":"espolvorear"
		}
		var actions_dk={
			"k1": "terninger","k2": "hak",
			"k3": "skræl","k4": "mix",
			"k5": "koge","k6": "koge",
			"k7": "udblød","k8": "slibe",
			"k9": "ryst","k10": "steg",
			"k11":"bage","k12":"drysse"
		}
		var actions={}
		if lang=="en":
			actions=actions_en
		elif lang=="es":
			actions=actions_es	
		elif lang=="dk":
			actions=actions_dk			
		if actions.k1 in item or actions.k2 in item:
			animated_sprite_2d_2.visible=false
			animated_sprite_2d.visible=true
			animated_sprite_2d_3.visible=false
			animated_sprite_2d_4.visible=false
			animated_sprite_2d_5.visible=false
			animated_sprite_2d_6.visible=false
			animated_sprite_2d_8.visible=false
		elif actions.k3 in item:
			animated_sprite_2d_2.visible=true
			animated_sprite_2d.visible=false
			animated_sprite_2d_3.visible=false
			animated_sprite_2d_4.visible=false
			animated_sprite_2d_5.visible=false
			animated_sprite_2d_6.visible=false		
			animated_sprite_2d_8.visible=false
		elif actions.k4 in item or actions.k12 in item:
			animated_sprite_2d.visible=false
			animated_sprite_2d_2.visible=false
			animated_sprite_2d_3.visible=true
			animated_sprite_2d_4.visible=false		
			animated_sprite_2d_6.visible=false		
			animated_sprite_2d_8.visible=false
			await get_tree().create_timer(1.5).timeout
			animated_sprite_2d_5.visible=true
			animated_sprite_2d_3.visible=false
		elif actions.k5 in item or actions.k6 in item or actions.k10 in item or actions.k11 in item:
			animated_sprite_2d_4.visible=true;
			animated_sprite_2d.visible=false
			animated_sprite_2d_2.visible=false
			animated_sprite_2d_3.visible=false
			animated_sprite_2d_5.visible=false
			animated_sprite_2d_6.visible=false		
			animated_sprite_2d_8.visible=false
		elif actions.k7 in item:
			animated_sprite_2d_6.visible=true
			animated_sprite_2d_4.visible=false;
			animated_sprite_2d.visible=false
			animated_sprite_2d_2.visible=false
			animated_sprite_2d_3.visible=false
			animated_sprite_2d_5.visible=false		
			animated_sprite_2d_8.visible=false
		elif actions.k8 in item or actions.k9 in item:
			animated_sprite_2d_6.visible=false
			animated_sprite_2d_4.visible=false;			
			animated_sprite_2d.visible=false
			animated_sprite_2d_2.visible=false
			animated_sprite_2d_3.visible=false
			animated_sprite_2d_5.visible=false
			animated_sprite_2d_8.visible=true



func _on_end_coooking_pressed():
	var startScrn=load("res://kidsScene/eating.tscn")
	get_tree().change_scene_to_packed(startScrn)
