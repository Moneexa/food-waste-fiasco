extends Node

var lang=LanguageScrnState.lang
@onready var item_list = $ItemList

# Called when the node enters the scene tree for the first time.
func _ready():
	if lang=="en":
		item_list.add_item("Make sure your child loves imperfect color texture shape and size of the food.",null,true)
		item_list.add_item("Always involve your child in cooking process.",null,true)		
		item_list.add_item("Make your child understand their hunger and fullness cues.",null,true)
		item_list.add_item("Educate your child about how to dispose off the cooking leftovers. Some food is recycleable as well",null,true)
	elif lang=="es":
		item_list.add_item("Asegúrese de que a su hijo le guste el color imperfecto, la textura, la forma y el tamaño de la comida.", null,true)
		item_list.add_item("Siempre involucre a su hijo en el proceso de cocción.", null, true)		
		item_list.add_item("Haga que su hijo comprenda sus señales de hambre y saciedad.",null,true)
		item_list.add_item("Eduque a su hijo sobre cómo deshacerse de los restos de la cocina. Algunos alimentos también son reciclables",null,true)
	elif lang=="dk":
		item_list.add_item("Sørg for, at dit barn elsker ufuldkommen farvetekstur, form og størrelse på maden.",null,true)
		item_list.add_item("Involver altid dit barn i madlavningsprocessen.",null,true)		
		item_list.add_item("Få dit barn til at forstå deres sult- og mæthedstegn.",null,true)
		item_list.add_item("Uddan dit barn i, hvordan man bortskaffer madrester. Noget mad kan også genbruges",null,true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_texture_button_pressed():
	var menuScrn=preload("res://prentsScene/menuScene.tscn")
	get_tree().change_scene_to_packed(menuScrn)
