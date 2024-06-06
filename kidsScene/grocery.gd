extends Node


var showVesggies=false;
var showFruits=false;

@onready var veggie_container = $VeggieContainer

@onready var fruits = $FruitContainer
@onready var label = $Label

@onready var left = $TextureRect2
@onready var right = $TextureRect3
@onready var main_menu = $HBoxContainer
@onready var add_cart_button = $TextureButton
var lang=LanguageScrnState.lang
func fill_container():
	var groceryItems=Grocery.groceryItems;
	for item in groceryItems:
			var textureBtn= TextureButton.new()
			textureBtn.texture_normal=load(item.path)
			var focussedPath=""
			if item.path.ends_with('.png'):
				focussedPath=item.path.replace('.png', '-selected.png')
			elif item.path.ends_with('.PNG'):
				focussedPath=item.path.replace('.PNG', '-selected.png')	
			textureBtn.texture_focused=load(focussedPath)
			textureBtn.ignore_texture_size=true
			textureBtn.stretch_mode=TextureButton.STRETCH_SCALE
			textureBtn.custom_minimum_size=Vector2(150,130)
			textureBtn.size_flags_horizontal=Control.SIZE_SHRINK_BEGIN
			textureBtn.size_flags_vertical=Control.SIZE_SHRINK_CENTER		

			textureBtn.connect("pressed", Callable(self, "_on_veg_pressed").bind(item))
			var label = Label.new()
			if item.weight>=1000:
					label.text=item.name+"  Price:  $"+str(item.price)+" BB:  "+"23/05/2024  Weight: "+str(item.weight/1000)+"kg"
			else:
					label.text=item.name+"  Price:  $"+str(item.price)+" BB:  "+"23/05/2024  Weight: "+str(item.weight)+"grams"					

			label.horizontal_alignment=HORIZONTAL_ALIGNMENT_CENTER
			label.vertical_alignment=VERTICAL_ALIGNMENT_CENTER
			label.autowrap_mode=TextServer.AUTOWRAP_WORD
			label.add_theme_color_override("font_color", Color.BLACK)
			label.add_theme_font_size_override("font_size", 10)
			var vBoxCont= VBoxContainer.new()

			vBoxCont.add_child(textureBtn)
			vBoxCont.add_child(label)
			if int(item.id)<8:
				veggie_container.add_child(vBoxCont)
			elif int(item.id)>=8:
				fruits.add_child(vBoxCont)	


# Called when the node enters the scene tree for the first time.
func _ready():
	if lang=="en":
		label.text="Choose Items to Shop"
		add_cart_button.texture_normal=load("res://thesisProjectAssets/groceryItems/addToCart.PNG")
	elif lang=="es":
			label.text="Elija artículos para comprar"
			add_cart_button.texture_normal=load("res://thesisProjectAssets/groceryItems/addToCart-es.png")
	elif lang=="dk":
		label.text="Vælg varer, du vil købe"
		add_cart_button.texture_normal=load("res://thesisProjectAssets/groceryItems/addToCart-dk.png")
	fill_container()
	

func check_visibility():
		if showVesggies:
			veggie_container.visible=true;
			fruits.visible=false;
		elif showFruits:
			fruits.visible=true;
			veggie_container.visible=false;
		else:
			fruits.visible=false;				
			veggie_container.visible=false;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

	

func _on_add_to_cart_pressed():
	var cartScene=load("res://kidsScene/cart  .tscn")		
	get_tree().change_scene_to_packed(cartScene)



func _on_fruits_pressed():
	showFruits=true
	showVesggies=false
	main_menu.visible=false
	left.visible=true
	right.visible=true;
	check_visibility()
	add_cart_button.visible=true;


func _on_veggies_pressed():
		showVesggies=true
		showFruits=false
		main_menu.visible=false
		left.visible=true
		right.visible=true;

		check_visibility()
		add_cart_button.visible=true;

func _on_left_pressed():
	main_menu.visible=true
	showVesggies=false;
	showFruits=false;
	check_visibility()
	add_cart_button.visible=false;
	left.visible=false;
	right.visible=false
func _on_right_pressed():
	main_menu.visible=false;
	showFruits=true;
	showVesggies=false;
	check_visibility()
	add_cart_button.visible=true

func _on_veg_pressed(item):
	Grocery.groceryList.append(item)
	
func _on_fruit_pressed(item):
	Grocery.groceryList.append(item)

