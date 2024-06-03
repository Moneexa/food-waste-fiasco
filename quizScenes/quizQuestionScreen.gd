extends Node

var questions = [
	{
		"question": "Sarah con su mamá en el supermercado ve manzanas en oferta. Emocionada, convence a su mamá para que le compre dos bolsos grandes. Sin embargo, después de una semana, la mitad de las manzanas aún no se han consumido y empiezan a echarse a perder. ¿Qué podrían haber hecho Sarah y su mamá de manera diferente para evitar desperdiciar comida?", 
		"options": ["Compra sólo una bolsa de manzanas y comprueba primero las que ya tenían en casa",
		"Compre ambas bolsas y déjelas afuera para atraer pájaros.",
		"Compre cuatro bolsas porque la oferta era demasiado buena para perderla."],
		"correct": 0
	},
	{
		"question": "Mientras compra, Zoe encuentra un cartón de huevos en oferta, pero vence mañana. ¿Cuál es la mejor opción para que Zoe se asegure de que sea sostenible desde el punto de vista alimentario?",
		"options": ["Compre mucho porque es barato, incluso si parte se puede desperdiciar.", 
		"Compre sólo lo que realmente consumirá antes de la fecha de vencimiento", 
		"Cómprelo todo y dónelo a un refugio."], 
		"correct": 1
	},
	{
		"question":"Lucas y sus amigos hicieron un picnic y sobraron muchas rodajas de fruta. ¿Cuál es la mejor manera de almacenar estas frutas para garantizar que duren más?",
		"options":["Déjalos en la cesta de picnic para el día siguiente.",
		"Ponlos directamente en el frigorífico sin tapa.",
		"Colóquelos en recipientes herméticos antes de refrigerarlos"],
		"correct":2
	},	
	{
		"question":"Después de cenar, Kevin se da cuenta de que su familia suele tirar las sobras porque se olvidan de ellas en el frigorífico. ¿Cómo puede Kevin ayudar a reducir el desperdicio de alimentos?",
		"options":["Sugiera comer las sobras antes de preparar una nueva comida.",
		"Sigue tirándolos",
		"Anima a su familia a cocinar menos comida."],
		"correct":2
	},
	{
		"question":"A Max le encanta cocinar, pero termina con muchas cáscaras y restos de verduras. ¿Qué puede hacer Max para aprovechar al máximo estos restos en lugar de tirarlos?",
		"options":["Inicie un contenedor de abono para jardinería.",
		"Úsalos para hacer un caldo de verduras.",
		"Tíralos; no sirven."],
		"correct":1
	},#questions as needed
]

var current_question = 0
var score=0
@onready var score_label = $VBoxContainer/Label2
@onready var energy_bar = $HBoxContainer/VBoxContainer2/TextureRect
@onready var hunger_bar = $HBoxContainer/VBoxContainer2/TextureRect
var sprit=preload("res://subscene/spirit/spirit.tscn")
@onready var popup = $"."

var changeScreen=preload("res://spanishScenes/quizScenes/quizReward .tscn")




@onready var answer_button_template = $VBoxContainer/Button
@onready var animated_sprite_2d = $VBoxContainer/AnimatedSprite2D
@onready var v_box_container = $VBoxContainer


@onready var answer_buttons = []

func _ready():
	answer_button_template.hide()  # Hide the template button
	load_question(current_question)

func load_question(index):
	animated_sprite_2d.visible=true
	if index==0:
		animated_sprite_2d.play("q1")
	elif index==1:
		animated_sprite_2d.play("q2")		

	elif index==2:
		animated_sprite_2d.play("q3")		
	elif index==3:
		animated_sprite_2d.play("q4")
	elif index==4:
		animated_sprite_2d.play("q5")
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
	score_label.text="Score: "+str(score)+"/5"
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

		
	
