extends Node
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var label_2 = $Label2
@onready var food_suuggestions = $ItemList
@onready var label = $Label
var recipes = {
	"Fruit Salad": ["apples", "strawberries", "kiwis", "mangoes"],
	"Fruit Smoothie": ["strawberries", "kiwis"],
	"Vegetable Salad": ["carrots", "capsicum","potatoes", "corn"],
	"French Fries": ["potatoes"],
	"Baked Potatoes": ["potatoes"],
	"Vegetable Soup": ["carrots", "capsicum", "corn"],
	"Carrot Pudding": ["carrots"]
}

@onready var heading = $Label

# Called when the node enters the scene tree for the first time.
var possible_dishes = []

func suggest_dishes(available_ingredients):
	for recipe in recipes.keys():
		var required_ingredients=recipes[recipe]
		print("stuff to make", recipe, "required items", required_ingredients, "available ing", available_ingredients)
		for item in required_ingredients:
			if item in available_ingredients and recipe not in possible_dishes:
				possible_dishes.append(recipe)
	return possible_dishes

func populate_sugg():
	var ingredients=[]
	for item in Grocery.groceryList:
		if item!={}:
			ingredients.append(item.name.split(" ")[1].to_lower())
	print("ingredients", ingredients)		
	var dishes=suggest_dishes(ingredients)
	print("list of possible dishes", dishes)
	for dish in dishes:
		food_suuggestions.add_item(dish, load("res://thesisProjectAssets/dishesToPrep/"+dish+".PNG"),true);
	food_suuggestions.connect("item_clicked", Callable(self, "_on_item_clicked"))

		
	#food_suuggestions.add_item("Fruit Salad",load("res://thesisProjectAssets/fruitSalad.PNG"), true);
	#food_suuggestions.add_item("Fruit Smoothie",load("res://thesisProjectAssets/smoothie.PNG"), true);
	#food_suuggestions.add_item("Vegetable Salad",load("res://thesisProjectAssets/salad.PNG") , true);
	#food_suuggestions.add_item("French Fries",load("res://thesisProjectAssets/fries.PNG"), true);
	#food_suuggestions.add_item("Baked Potatoes", load("res://thesisProjectAssets/bakedPot.PNG"),true);
	#food_suuggestions.add_item("Vegetable Soup", load("res://thesisProjectAssets/soup.PNG"),true);
	#food_suuggestions.add_item("Carrot Pudding",load("res://thesisProjectAssets/pudding.PNG"),true);
var lang=LanguageScrnState.lang
func _ready():
	if lang=="en":
		heading.text="Lets Analyze your Grocery"
	elif lang=="es":
		heading.text="Analicemos su compra"			
	elif lang=="dk":
		heading.text="Lad os analysere din købmand"			

	populate_sugg()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_item_clicked(index, at_position, mouse_pos):
	var dish = food_suuggestions.get_item_text(index)
	CookingState.chosenDish=dish
	print("************** chosen dsh *************", CookingState.chosenDish)
	var cookingScrn=load("res://kidsScene/cooking.tscn")
	get_tree().change_scene_to_packed(cookingScrn)
	
func _on_animated_sprite_2d_frame_changed():
	if animated_sprite_2d.frame==3:
		animated_sprite_2d.visible=false
		food_suuggestions.visible=true;
		label_2.visible=true
		label.visible=false
