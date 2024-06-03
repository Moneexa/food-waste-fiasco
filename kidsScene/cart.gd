extends Node
@onready var grid_container = $GridContainer
@onready var thinkCloud = $TextureRect2
@onready var character_body_2d = $CharacterBody2D
@onready var wieght = $Label3
@onready var cost = $Label4
var weight_cart=0
var price=0
@onready var weight_notification = $TextureRect3
var selectedItemsToBeRemoved=[]
# Called when the node enters the scene tree for the first time.
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
		
			
@onready var texture_rect_2 = $TextureRect2
@onready var texture_rect_3 = $TextureRect3
@onready var texture_button = $TextureButton
		

func update_grid():
	var arr=Grocery.groceryList
	print(arr)
	weight_cart=0
	price=0
	for item in arr:
		print(item)
		if item!={}:
			if is_expiry_date_passed(item.expiry_date):
				texture_rect_2.visible=true
			var smallCarrotBtn=TextureButton.new()
			smallCarrotBtn.texture_normal=load(item.path)
			var selectedPath=item.path;
			if selectedPath.ends_with(".png"):
				selectedPath= selectedPath.replace(".png", "-selected.png")
			elif selectedPath.ends_with(".PNG"):
				selectedPath=selectedPath.replace(".PNG","-selected.png")
			smallCarrotBtn.texture_focused=load(selectedPath)
			smallCarrotBtn.ignore_texture_size=true
			smallCarrotBtn.stretch_mode=TextureButton.STRETCH_SCALE
			smallCarrotBtn.custom_minimum_size=Vector2(150,130)
			
			smallCarrotBtn.size_flags_horizontal=Control.SIZE_SHRINK_BEGIN
			smallCarrotBtn.size_flags_vertical=Control.SIZE_SHRINK_CENTER
			var smallCarrotLabel=Label.new()
			smallCarrotLabel.text=item.name+" $"+str(item.price)
			smallCarrotLabel.add_theme_color_override("font_color", Color.BLACK)
			smallCarrotLabel.horizontal_alignment=HORIZONTAL_ALIGNMENT_CENTER
			var callable=Callable(self,"_on_each_btn_pressed").bind(item)
			smallCarrotBtn.connect("pressed",callable)
			var vBoxCont= VBoxContainer.new()
			vBoxCont.add_child(smallCarrotBtn)
			vBoxCont.add_child(smallCarrotLabel)
			grid_container.add_child(vBoxCont)
			weight_cart+=item.weight
			price+=item.price
	print("************* the grocery list **************", Grocery.groceryList)		
	if weight_cart>=1000:
		wieght.text="Peso total: "+str(weight_cart/1000.0)+"kg";
	else:
		wieght.text="Peso total: "+str(weight_cart)+"grams";

	if weight_cart>1000:
		weight_notification.visible=true
		texture_rect_3.visible=true
		texture_button.visible=true
	cost.text="Precio total:"+" $"+str(price)
	CartPrice.price=price

	
func _ready():
		update_grid()
func _on_each_btn_pressed(item):
		if item in selectedItemsToBeRemoved:
			selectedItemsToBeRemoved.erase(item)
		else:
			selectedItemsToBeRemoved.append(item)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_checkout_pressed():
	var checkoutScene =preload("res://spanishScenes/kidsScene/checkout.tscn")
	get_tree().change_scene_to_packed(checkoutScene)


func _on_shop_again_pressed():	
	var checkoutScene =preload("res://spanishScenes/kidsScene/grocery.tscn")
	get_tree().change_scene_to_packed(checkoutScene)


func _on_remove_cart_pressed():
	for item in Grocery.groceryList:
		if item in selectedItemsToBeRemoved:
			Grocery.groceryList.erase(item)
			
			
	clear_grid_container()
	update_grid()


func clear_grid_container():
	for i in range(grid_container.get_child_count() - 1, -1, -1):
		var child = grid_container.get_child(i)
		grid_container.remove_child(child)
		child.queue_free()

