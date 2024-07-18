extends Node
var quizPerformance=preload("res://prentsScene/quizPerformance.tscn")
var groceryPerformance=preload("res://prentsScene/groceryPerformance .tscn")
var cookingPerformance=preload("res://prentsScene/cookingsPerformance.tscn")
var eatingPerformance=preload("res://prentsScene/eatingPerformance.tscn")
var leftOverPerformance=preload("res://prentsScene/leftOverPerformance.tscn")
var startScrn=preload("res://startScrn.tscn")
@onready var quiz_btn = $TextureButton
@onready var grocery_btn = $TextureButton2
@onready var meals_prep_btn = $TextureButton3
@onready var food_eaten_btn = $TextureButton5
@onready var left_over_btn = $TextureButton4
@onready var expor_btn = $TextureButton6
@onready var quick_tips_btn = $TextureButton7

@onready var progress_bar = $ProgressBar
@onready var timer = $Timer
@onready var file_dialog = $FileDialog
@onready var label = $ProgressBar/Label
@onready var heading = $Label
@onready var exit = $Button

var lang=LanguageScrnState.lang

func _ready():
	if lang=="en":
		heading.text="You Kid's Performance"
		label.text="Downloading Your Report"
		quiz_btn.texture_normal=load("res://thesisProjectAssets/parentsAssets/quiz.PNG")
		grocery_btn.texture_normal=load("res://thesisProjectAssets/parentsAssets/kidGrocery.PNG")
		meals_prep_btn.texture_normal=load("res://thesisProjectAssets/parentsAssets/mealsPrepared.PNG")
		food_eaten_btn.texture_normal=load("res://thesisProjectAssets/parentsAssets/foodConsumption.PNG")
		left_over_btn.texture_normal=load("res://thesisProjectAssets/parentsAssets/leftovers.PNG")
		quick_tips_btn.texture_normal=load("res://thesisProjectAssets/parentsAssets/quicktips.PNG")
		expor_btn.texture_normal=load("res://thesisProjectAssets/parentsAssets/exportBtn.PNG")
		exit.text="Exit the Game"
		
	elif lang=="es":
		heading.text="La actuación de tu hijo"
		label.text="Descargando su informe"
		quiz_btn.texture_normal=load("res://thesisProjectAssets/parentsAssets/quiz-es.png")
		grocery_btn.texture_normal=load("res://thesisProjectAssets/parentsAssets/kidGrocery-es.png")
		meals_prep_btn.texture_normal=load("res://thesisProjectAssets/parentsAssets/mealsPrepared-es.png")
		food_eaten_btn.texture_normal=load("res://thesisProjectAssets/parentsAssets/foodConsumption-es.png")
		left_over_btn.texture_normal=load("res://thesisProjectAssets/parentsAssets/leftovers-es.png")
		quick_tips_btn.texture_normal=load("res://thesisProjectAssets/parentsAssets/quicktips-es.png")
		expor_btn.texture_normal=load("res://thesisProjectAssets/parentsAssets/exportBtn-es.png")
		exit.text="Salir del juego"
		
	elif lang=="dk":
		heading.text="Dit barns præstation"	
		label.text="Downloader din rapport"
		quiz_btn.texture_normal=load("res://thesisProjectAssets/parentsAssets/quiz-dk.png")
		grocery_btn.texture_normal=load("res://thesisProjectAssets/parentsAssets/kidGrocery-dk.png")
		meals_prep_btn.texture_normal=load("res://thesisProjectAssets/parentsAssets/mealsPrepared-dk.png")
		food_eaten_btn.texture_normal=load("res://thesisProjectAssets/parentsAssets/foodConsumption-dk.png")
		left_over_btn.texture_normal=load("res://thesisProjectAssets/parentsAssets/leftovers-dk.png")
		quick_tips_btn.texture_normal=load("res://thesisProjectAssets/parentsAssets/quicktips-dk.png")
		expor_btn.texture_normal=load("res://thesisProjectAssets/parentsAssets/exportBtn-dk.png")
		exit.text="Afslut spillet"
		var stylebox_clicked = StyleBoxFlat.new()
		stylebox_clicked.bg_color = Color("blue") # Red color for normal state
		var stylebox_normal = StyleBoxFlat.new()
		stylebox_normal.bg_color = Color("#8FD400") # Green color for hover state
		var stylebx_hover = StyleBoxFlat.new()
		stylebx_hover.bg_color = Color("orange") # Red color for normal state
		exit.add_theme_stylebox_override("normal", stylebox_normal)
		exit.add_theme_stylebox_override("pressed", stylebox_clicked)
		exit.add_theme_stylebox_override("hover", stylebx_hover)		



func _process(delta):
	pass



func _on_quiz_performance_pressed():
	get_tree().change_scene_to_packed(quizPerformance)




func _on_grocery_purchased_pressed():
	get_tree().change_scene_to_packed(groceryPerformance)


func _on_cooking_performance_pressed():
	get_tree().change_scene_to_packed(cookingPerformance)
	


func _on_food_cons_pressed():
	get_tree().change_scene_to_packed(eatingPerformance)


func _on_leftover_pressed():
	get_tree().change_scene_to_packed(leftOverPerformance)
func parse_date(date_str):
	var parts = date_str.split("/")
	return {
		"day": int(parts[0]),
		"month": int(parts[1]),
		"year": int(parts[2])
	}


func _on_backarrow_pressed():
	get_tree().change_scene_to_packed(startScrn)

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
	

func save_file(file_name):
	print("storing fle at ")
	print(file_name)
	progress_bar.visible=true
	await yield_for_update(0)
	var file = FileAccess.open(file_name, FileAccess.WRITE)
	if not file:
		return ERR_CANT_OPEN
	else:
		# Write the header
		file.store_line("quiz_questions,quiz_answers")
		var record = QuizAnswers.quizQuestions
		if record["overpurchasing"] == 0:
			file.store_line("overpurchasing,Needs Knowledge")
		elif record["overpurchasing"] == 1:
			file.store_line("overpurchasing,Knows Accurately")
		
		if record["expiredItems"] == 0:
			file.store_line("expiredItems,Need Knowledge")
		elif record["expiredItems"] == 1:
			file.store_line("expiredItems,Knows well")
		
		if record["overcooking"] == 0:
			file.store_line("overcooking,Need Knowledge")
		elif record["overcooking"] == 1:
			file.store_line("overcooking,Knows Accurately")
		
		if record["foodStorage"] == 0:
			file.store_line("foodStorage,Need Knowledge")
		elif record["foodStorage"] == 1:
			file.store_line("foodStorage,Knows Accurately")
		
		if record["recycleFood"] == 0:
			file.store_line("recycleFood,Need Knowledge")
		elif record["recycleFood"] == 1:
			file.store_line("recycleFood,Knows Accurately")
		await yield_for_update(25)
		# Blank line to separate sections
		file.store_line("")
		# Collect preferred veggies and fruits
		var preferred_veggies = []
		var preferred_fruits = []
		var itemsExpired=0
		for item in Grocery.groceryList:
			if item != {}:
				if int(item.id) < 8:
					preferred_veggies.append(item.name)
				else:
					preferred_fruits.append(item.name)
				var is_exp=is_expiry_date_passed(item.expiry_date)
				if is_exp:
					itemsExpired+=1
		file.store_line("preferred_veggies,names")
		for i in range(preferred_veggies.size()):
			file.store_line(str(i+1) + "," + preferred_veggies[i])
			
		file.store_line("")
		await yield_for_update(50)

		file.store_line("preferred_fruits,names")
		for i in range(preferred_fruits.size()):
			file.store_line(str(i+1) + "," + preferred_fruits[i])
				# Calculate expiry knowledge score
		file.store_line("")
		await yield_for_update(75)
		file.store_line("Score of expired dates know-how, remarks")		
		var expiry_knowledge = 100.0 - (float(itemsExpired) / float(Grocery.groceryList.size()) * 100.0)
		var expiry_remark = ""
		if expiry_knowledge < 50:
			expiry_remark = "Needs to know about expiry"
		elif expiry_knowledge > 50 and expiry_knowledge < 75:
			expiry_remark = "The kid is aware of expiry"
		elif expiry_knowledge > 75:
			expiry_remark = "The kid knows really well"
		file.store_line(str(expiry_knowledge)+"%,"+expiry_remark)	
		file.store_line("")	
		file.store_line("Score of money spending knowledge, money spent, coins remaining,  remarks")				
		# Calculate money usage knowledge score
		var money_knowledge = 100.0 - (float(CartPrice.price) / float(HungerQuestState.coins) * 100.0)
		var money_remark = ""
		if money_knowledge <= 50:
			money_remark = "The kid still needs to know money usage"
		elif money_knowledge > 50 and money_knowledge < 75:
			money_remark = "The kid can improve more"
		elif money_knowledge >= 75:
			money_remark = "The kid shops smartly"
		file.store_line(str(money_knowledge)+"%,"+str(float(CartPrice.price))+","+str(float(HungerQuestState.coins)-float(CartPrice.price))+","+money_remark)
		file.store_line("")
		file.store_line("Score of cooking knowledge,remarks")
		var cookingScore=CookingState.cookingScore
		var cookingRemarks=""
		if cookingScore<50:
				cookingRemarks="Needs to participate in kitcheb"
		elif cookingScore>50 and cookingScore<75:
			cookingRemarks="The kid has a good kitchen observation"
		elif cookingScore>75:
			cookingRemarks="The kid is a masterchef"
		file.store_line(str(cookingScore)+"%,"+cookingRemarks)
		file.store_line("")
		file.store_line("Percentage of food eaten,remarks")
		var foodWeight=0
		var food_eaten=0
		var food_remarks=""
		for item in Grocery.groceryList:
			if item!={}:
				foodWeight+=item.weight;
		var remainingFood=EatingStates.remainingFood
		if remainingFood["amount"]==0:
			food_eaten=100
			food_remarks="Food Completely Finished"
		else:
			food_eaten=int(100-((remainingFood["amount"]/foodWeight)*100))
			if food_eaten<=50:
				food_remarks="Food completed almost half"
			else:
				food_remarks="More food could have been eaten"
		file.store_line(str(food_eaten)+"%,"+food_remarks)
		file.store_line("")
		file.store_line("Hunger Satisified, Remarks")
		if EatingStates.percentageOfHungerSatisified<=33:
			file.store_line("Upto 33%, More food should be eaten")
		elif EatingStates.percentageOfHungerSatisified<=66:
			file.store_line("Upto 6%, Still needs to eat more food")
		if EatingStates.percentageOfHungerSatisified<=100:
			file.store_line("Upto 100%, Hunger fully satisified")
		file.store_line("")			
		file.store_line("item to sort, place chosen to keep,remarks")
		await yield_for_update(90)
		for item in LeftOversLocalStates.decision_list:
			if item!={}:
				if item.source=="0":
					if item.destination=="soil":
						file.store_line("leftover cooked meal,"+item.destination+",should have been kept in fridge")
					elif item.destination=="fridge":
						file.store_line("leftover cooked meal,"+item.destination+",thats the right place")							
					elif item.destination=="kitchen":
						file.store_line("leftover cooked meal,"+item.destination+",should have been kept in fridge")
					else:
						file.store_line("leftover cooked meal,"+item.destination+",food should not be thrown like this")														
				elif item.source=="1":
					if item.destination=="soil":
						file.store_line("Seeds and pulps that cant be reused,"+item.destination+",thats the right place")
					elif item.destination=="fridge":
						file.store_line("Seeds and pulps that cant be reused,"+item.destination+",should have been burried in soil")							
					elif item.destination=="kitchen":
						file.store_line("Seeds and pulps that cant be reused,"+item.destination+",should have been burried in soil")
					else:
						file.store_line("Seeds and pulps that cant be reused,"+item.destination+",food should not be thrown like this")														
				elif item.source=="2":
					if item.destination=="soil":
						file.store_line("Vegetables and fruit peels,"+item.destination+",they dont have to go there")
					elif item.destination=="fridge":
						file.store_line("Vegetables and fruit peels,"+item.destination+",they dont have to go there")							
					elif item.destination=="kitchen":
						file.store_line("Vegetables and fruit peels,"+item.destination+",yes they should be cooked to recycle")
					else:
						file.store_line("Vegetables and fruit peels,"+item.destination+",food should not be thrown like this")														
		

		progress_bar.visible=false
		if lang=="en":
			label.text="Downloaded"
		elif lang=="es":
			label.text="Descargada"
		elif lang=="dk":
			label.text="Downloadet"
		file.close()
		exit.visible=true
		print("Data exported")
		return OK
func yield_for_update(value = 0):
	if value > 0:
		progress_bar.value = value
	timer.start()
	await timer.timeout

func _on_updateTimer_timeout():
	# This function is just to ensure the timer signal is connected properly
	pass
func prompt_save_file():
	file_dialog.popup()
	if OS.get_name() == 'Android':
		file_dialog.current_path = "/storage/emulated/0/" # Default filename


func _on_file_dialog_file_selected(path):
	var error = await save_file(path)
	if error != OK:
		handle_error(error, path)

func handle_error(error: int, file_path: String):
	
	match error:
		ERR_CANT_OPEN:
			push_error("Failed to open file for writing: " + file_path)
		ERR_FILE_MISSING:
			push_error("File not found after writing: " + file_path)
		ERR_FILE_CORRUPT:
			push_error("File corrupt after writing: " + file_path)
		_:
			push_error("Unknown error occurred: " + str(error))

# Error constants
const ERR_CANT_OPEN = 1
const ERR_FILE_MISSING = 2
const ERR_FILE_CORRUPT = 3
const OK = 0


func _on_quicktips_pressed():
	var quicktips=preload("res://prentsScene/tips.tscn")
	get_tree().change_scene_to_packed(quicktips)


func _on_button_pressed():
	get_tree().quit()

