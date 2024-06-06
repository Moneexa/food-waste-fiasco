extends Node


var questions =[] 

var current_question = 0
var score=0
@onready var score_label = $VBoxContainer/Label2
@onready var energy_bar = $HBoxContainer/VBoxContainer2/TextureRect
@onready var hunger_bar = $HBoxContainer/VBoxContainer2/TextureRect
var sprit=preload("res://subscene/spirit/spirit.tscn")
@onready var popup = $"."

var changeScreen=preload("res://quizScenes/quizReward .tscn")




@onready var answer_button_template = $VBoxContainer/Button
@onready var animated_sprite_2d = $VBoxContainer/AnimatedSprite2D
@onready var v_box_container = $VBoxContainer


@onready var answer_buttons = []

func _ready():
	if LanguageScrnState.lang=="en":
		questions=[
			{
				"question": "Sarah with her mother in the supermarket sees apples on sale. Excited, she convinces her mother to buy her two large bags. However, after a week, half of the apples have not yet been consumed and start to spoil. What could Sarah and her mom have done differently to avoid wasting food?", 
				"options": ["Buy only one bag of apples and check what they already had at home first",
				"Buy both bags and leave them outside to attract birds.",
				"Buy four bags because the deal was too good to miss."],
				"correct": 0
			},
			{
				"question": "While shopping, Zoe finds a carton of eggs on sale, but it expires tomorrow. What's the best option for Zoe to make sure it's food-sustainable?",
				"options": ["Buy a lot because it's cheap, even if some of it may go to waste.",
				"Buy only what you will actually consume before the expiration date", 
				"Buy it all and donate it to a shelter."], 
				"correct": 1
			},
			{
				"question":"Lucas and his friends had a picnic and had a lot of fruit slices left over. What is the best way to store these fruits to ensure they last longer?",
				"options":["Leave them in the picnic basket for the next day.",
				"Put them directly in the refrigerator without the lid.",
				"Place them in airtight containers before refrigerating"],
				"correct":2
			},	
			{
				"question": "After dinner, Kevin notices that his family often throws away leftovers because they forget about them in the refrigerator. How can Kevin help reduce food waste?",
				"options":["Suggest eating leftovers before preparing a new meal.",
				"Keep throwing them",
				"Encourage your family to cook less food."],
				"correct":2
			},
			{
				"question": "Max loves to cook, but he ends up with a lot of peelings and vegetable scraps. What can Max do to make the most of these scraps instead of throwing them away?",
				"options":["Start a garden compost bin.",
				"Use them to make vegetable broth.",
				"Throw them away; they are no good."
				],
				"correct":1
			},#questions as needed
		]
	elif LanguageScrnState.lang=="es":
		questions=[
			{
				"question": "Sarah with her mother in the supermarket sees apples on sale. Excited, she convinces her mother to buy her two large bags. However, after a week, half of the apples have not yet been consumed and start to spoil. What could Sarah and her mom have done differently to avoid wasting food?", 
				"options": ["Compra sólo una bolsa de manzanas y comprueba primero las que ya tenían en casa",
				"Compre ambas bolsas y déjelas afuera para atraer pájaros.",
				"Compre cuatro bolsas porque el trato era demasiado bueno para desaprovecharlo."],
				"correct": 0
			},
			{
				"question": "While shopping, Zoe finds a carton of eggs on sale, but it expires tomorrow. What's the best option for Zoe to make sure it's food-sustainable?",
				"options": ["Compra mucho porque es barato, incluso si parte se desperdicia.",
				"Compre sólo lo que realmente consumirá antes de la fecha de vencimiento", 
				"Cómprelo todo y dónelo a un refugio."], 
				"correct": 1
			},
			{
				"question":"Lucas and his friends had a picnic and had a lot of fruit slices left over. What is the best way to store these fruits to ensure they last longer?",
				"options":["Déjalos en la cesta de picnic para el día siguiente.",
				"Póngalos directamente en el frigorífico sin tapa.",
				"Colóquelos en recipientes herméticos antes de refrigerarlos."],
				"correct":2
			},	
			{
				"question": "After dinner, Kevin notices that his family often throws away leftovers because they forget about them in the refrigerator. How can Kevin help reduce food waste?",
				"options":["Sugiera comer las sobras antes de preparar una nueva comida.",
				"Sigue tirándolos",
				"Anima a tu familia a cocinar menos comida."],
				"correct":2
			},
			{
				"question": "Max loves to cook, but he ends up with a lot of peelings and vegetable scraps. What can Max do to make the most of these scraps instead of throwing them away?",
				"options":["Inicie un contenedor de abono para el jardín.",
				"Úsalos para hacer caldo de verduras.",
				"Tíralos, no sirven para nada."
				],
				"correct":1
			},#questions as needed
		]
	elif LanguageScrnState.lang=="dk":
		questions=[
			{
				"question": "Sarah with her mother in the supermarket sees apples on sale. Excited, she convinces her mother to buy her two large bags. However, after a week, half of the apples have not yet been consumed and start to spoil. What could Sarah and her mom have done differently to avoid wasting food?", 
				"options": ["Køb kun én pose æbler og tjek først, hvad de allerede havde derhjemme.",
				"Køb begge tasker og lad dem stå udenfor for at tiltrække fugle.",
				"Jeg købte fire poser, fordi aftalen var for god til at gå glip af."],
				"correct": 0
			},
			{
				"question": "While shopping, Zoe finds a carton of eggs on sale, but it expires tomorrow. What's the best option for Zoe to make sure it's food-sustainable?",
				"options": ["Køb meget, fordi det er billigt, selvom noget af det går til spilde.",
				"Køb kun det, du rent faktisk vil forbruge inden udløbsdatoen", 
				"Køb det hele og doner det til et krisecenter."], 
				"correct": 1
			},
			{
				"question":"Lucas and his friends had a picnic and had a lot of fruit slices left over. What is the best way to store these fruits to ensure they last longer?",
				"options":["Lad dem ligge i picnickurven til næste dag.",
				"Sæt dem direkte i køleskabet uden låg.",
				"Placer dem i lufttætte beholdere før de køles."],
				"correct":2
			},	
			{
				"question": "After dinner, Kevin notices that his family often throws away leftovers because they forget about them in the refrigerator. How can Kevin help reduce food waste?",
				"options":["Foreslå at spise rester, før du tilbereder et nyt måltid.",
				"Bliv ved med at smide dem",
				"Opmuntr din familie til at lave mindre mad."],
				"correct":2
			},
			{
				"question": "Max loves to cook, but he ends up with a lot of peelings and vegetable scraps. What can Max do to make the most of these scraps instead of throwing them away?",
				"options":["Start en havekompostbeholder.",
				"Brug dem til at lave grøntsagsbouillon.",
				"Smid dem væk, de er ubrugelige."
				],
				"correct":1
			},#questions as needed
		]		

	answer_button_template.hide()  # Hide the template button
	load_question(current_question)
var lang=LanguageScrnState.lang
func load_question(index):
	animated_sprite_2d.visible=true
	if index==0:
		if lang=="en":
			animated_sprite_2d.play("q1")
		elif lang=="es":
			animated_sprite_2d.play("q1-es")
		elif lang=="dk":
			animated_sprite_2d.play("q1-dk")			
						
	elif index==1:
		if lang=="en":
			animated_sprite_2d.play("q2")
		elif lang=="es":
			animated_sprite_2d.play("q2-es")			
		elif lang=="dk":
			animated_sprite_2d.play("q2-dk")			

	elif index==2:
		if lang=="en":
			animated_sprite_2d.play("q3")
		elif lang=="es":
			animated_sprite_2d.play("q3-es")			
		elif lang=="dk":
			animated_sprite_2d.play("q3-dk")			

	elif index==3:
		if lang=="en":
			animated_sprite_2d.play("q4")
		elif lang=="es":
			animated_sprite_2d.play("q4-es")			
		elif lang=="dk":
			animated_sprite_2d.play("q4-dk")			
		
	elif index==4:
		if lang=="en":
			animated_sprite_2d.play("q5")
		elif lang=="es":
			animated_sprite_2d.play("q5-es")			
		elif lang=="dk":
			animated_sprite_2d.play("q5-dk")			

			#question_image.add_child(scrn.instantiate())
	clear_old_buttons()
		
	if index==2 or index==3:
		energy_bar.texture=load("res://thesisProjectAssets/Speedometer3.png")
		hunger_bar.texture=load("res://thesisProjectAssets/Speedometer3.png")
	if index==4:
		energy_bar.texture=load("res://thesisProjectAssets/Speedometer2.png")
		hunger_bar.texture=load("res://thesisProjectAssets/Speedometer1.png")
		var spiritScene=sprit.instantiate()
		add_child(spiritScene)

	for i in range(questions[index]["options"].size()):
		var button = answer_button_template.duplicate()
		button.show()
		button.text = questions[index]["options"][i]
		button.connect("pressed",Callable(self, "_on_AnswerButton_pressed").bind(i))
		v_box_container.add_child(button)
		answer_buttons.append(button)

func _on_AnswerButton_pressed(index):
	var style = StyleBoxFlat.new()
	if index == questions[current_question]["correct"]:
		print("Correct answer!")
		score+=1
		if current_question==0:
			QuizAnswers.quizQuestions["overpurchasing"]=1
		elif current_question==1:
			QuizAnswers.quizQuestions["expiredItems"]=1
		elif current_question==2:
			QuizAnswers.quizQuestions["overcooking"]=1
		elif current_question==3:
			QuizAnswers.quizQuestions["foodStorage"]=1
		elif current_question==4:
			QuizAnswers.quizQuestions["recycleFood"]=1										
		style.bg_color=Color.GREEN

	else:
		print("Wrong answer!")

		style.bg_color=Color.RED
	# Load the next question or finish the quiz
	current_question += 1
	if LanguageScrnState.lang=="en":
		score_label.text="Score: "+str(score)+"/5"
	elif LanguageScrnState.lang=="es":
		score_label.text="Puntaje: "+str(score)+"/5"			
	if current_question < questions.size():
		load_question(current_question)
	else:
		print("Quiz completed!")
		complete_quiz(score)
		var quizAnswers=QuizAnswers.quizQuestions
		print(quizAnswers)

func clear_old_buttons():
	for button in answer_buttons:
		button.queue_free()  # Remove the old buttons
	answer_buttons.clear()


func complete_quiz(score):
	print(score)
	QuizScore.score=score;

	get_tree().change_scene_to_packed(changeScreen)
#	add_child(changeScreen.instantiate())

		
	
