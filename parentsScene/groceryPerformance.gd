extends Node
@onready var veggie_container = $VeggieContainer
@onready var heading = $Label
@onready var preferred_veggies_labe = $Label2
@onready var preferred_fruits_label = $Label3

@onready var fruit_container = $FruitContainer
@onready var title_1 = $Title1
@onready var title_2 = $Title2
@onready var title_3 = $Title3

@onready var texture_progress_bar = $TextureProgressBar
@onready var texture_progress_bar_2 = $TextureProgressBar2
@onready var texture_progress_bar_3 = $TextureProgressBar3
@onready var title1Label = $TextureProgressBar/Label
@onready var title2Label = $TextureProgressBar2/Label
@onready var title3Label = $TextureProgressBar3/Label
var lang=LanguageScrnState.lang
func parse_date(date_str):
	var parts = date_str.split("/")
	return {
		"day": int(parts[0]),
		"month": int(parts[1]),
		"year": int(parts[2])
	}

# Function to check if the expiry date has passed
func is_expiry_date_passed(expiry_date_str):
	var expiry_date = parse_date(expiry_date_str)
	var current_date = Time.get_datetime_dict_from_system()  # Get the current date from the OS
	if current_date.year>expiry_date.year:
		return true;
	elif current_date.year==expiry_date.year:
		if current_date.month>expiry_date.month:
			return true;
		elif current_date.month==expiry_date.month:
			if current_date.day>=expiry_date.day:
				return true
	return false
var title1arr=[]
var title2arr=[]
var title3arr=[]
# Called when the node enters the scene tree for the first time.
func _ready():
	if lang=="en":
		heading.text="Analysis of your child's grocery"
		title_1.text="Knowledge of expired-items"
		title_2.text="Awareness of over-purchasing"
		title_3.text="Sense of money spending"
		preferred_veggies_labe.text="Preferred Vegetables"
		preferred_fruits_label.text="Preferred Fruits"
		title1arr=["Needs to know about expiry", "The kid is kind of aware of expiry", "The kid knows really well"]
		title2arr=["The kid purchases blatantly","The kid has a bit control", "The kid shops what he should"]
		title3arr=["Kid used 75% money: blatant purchaser","The kid can improve: more than half money spent","The kid shops smartly, less than half money spent"]
	elif lang=="es":
		heading.text="Análisis de la compra de tu hijo"
		title_1.text="Conocimiento de artículos caducados."
		title_2.text="Conciencia de sobrecompra"
		title_3.text="Sensación de gastar dinero"
		preferred_veggies_labe.text="Verduras preferidas"
		preferred_fruits_label.text="Frutas preferidas"
		title1arr=["Necesita saber sobre la caducidad", "El niño es consciente de la caducidad", "El niño lo sabe muy bien"]
		title2arr=["El niño compra descaradamente","El niño tiene un poco de control", "El niño compra lo que debe"]
		title3arr=["El niño usó el 75% del dinero, comprador descarado","El niño puede mejorar, gastó más de la mitad del dinero","El niño compra inteligentemente, gastó menos de la mitad del dinero"]		
	elif lang=="dk":
		heading.text="Analyse af dit barns købmand"
		title_1.text="Kendskab til udløbne varer."
		title_2.text="Overkøbsbevidsthed"
		title_3.text="Følelse af at bruge penge"
		preferred_veggies_labe.text="Yndlingsgrøntsager"
		preferred_fruits_label.text="Yndlings frugter"
		title1arr=["Har brug for at vide om udløb", "Barnet er opmærksom på udløbet", "Barnet ved det godt"]
		title2arr=["Barnet køber skamløst", "Barnet har lidt styr på", "Barnet køber hvad det skal"]
		title3arr=["Barn brugte 75 % af pengene, skamløs køber","Barn kan gøre det bedre, brugte mere end halvdelen af ​​pengene","Barn køber smart, brugte mindre end halvdelen af ​​pengene"]		
	
	var totalWeight=0;
	var itemsExpired=0;
	print("Grocery Items purchased", Grocery.groceryList)
	for item in Grocery.groceryList:
		if item!={}:

			var textureBtn = TextureButton.new()
			textureBtn.ignore_texture_size=true
			textureBtn.stretch_mode=TextureButton.STRETCH_SCALE;
			textureBtn.texture_normal=load(item.path);
			textureBtn.custom_minimum_size=Vector2(100,100)
			var is_exp=is_expiry_date_passed(item.expiry_date)
			if is_exp:
				itemsExpired+=1
			var label=Label.new()
			label.text=item.name
			if item.weight>=36:
				totalWeight+=1
			var v_box= VBoxContainer.new()
			v_box.add_child(textureBtn)
			v_box.add_child(label)
			if int(item.id)<8:
				veggie_container.add_child(v_box)
			elif int(item.id)>=8:
				fruit_container.add_child(v_box)

	texture_progress_bar.value=100.0-(float(itemsExpired)/float(Grocery.groceryList.size())	*100.0)
	if texture_progress_bar.value<50:
		title1Label.text=title1arr[0]
	elif texture_progress_bar.value>50 and texture_progress_bar.value<75:
		title1Label.text=title1arr[1]
	elif texture_progress_bar.value>75:
		title1Label.text=title1arr[2]
	var calc1=float(totalWeight)/float(Grocery.groceryList.size())		
	texture_progress_bar_2.value=100.0-(float(totalWeight)/float(Grocery.groceryList.size())*100.0)
	if texture_progress_bar_2.value<50:
		title2Label.text=title2arr[0]
	elif texture_progress_bar_2.value>50 and texture_progress_bar_2.value<75:
		title2Label.text=title2arr[1]
	elif texture_progress_bar_2.value>75:
		title2Label.text=title2arr[2]
	var calc2=float(CartPrice.price)/float(HungerQuestState.coins)*100.0
	texture_progress_bar_3.value=float(CartPrice.price)/float(HungerQuestState.coins)*100.0
	if texture_progress_bar_3.value>75:
		title3Label.text=title3arr[0]
	elif texture_progress_bar_3.value>=50 and texture_progress_bar_3.value<=75:
		title3Label.text=title3arr[1]
	elif texture_progress_bar_3.value<50:
		title3Label.text=title3arr[2]
	texture_progress_bar_3.value=100.0-texture_progress_bar_3.value	
			

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_back_buttons_pressed():
	var menuScrn=preload("res://prentsScene/menuScene.tscn")
	get_tree().change_scene_to_packed(menuScrn)
