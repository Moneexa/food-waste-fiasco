extends Popup

# Define the questions and their answers
var questions = [
	{"question": "Sarah with her mom in the supermarket sees apples on sale. Excited, she convinces her mom to buy two large bags. However, after a week, half of the apples are still uneaten and starting to spoil. What could Sarah and her mom have done differently to avoid wasting food?", 
	"image":"res://thesisProjectAssets/quiz1.png",
	"options": [" Bought only one bag of apples and checked what they already had at home first",
	 "Bought both bags and left them outside to attract birds.",
	 "Bought four bags because the sale was too good to miss."], "correct": 0},
	{"question": "While shopping, Zoe finds eggs carton on sale, but it expires tomorrow. What’s the best choice for Zoe to make sure he’s being food sustainable?",
	"image":"res://thesisProjectAssets/quiz2.png", 
	"options": [" Buy a lot of it because it’s cheap, even if some of it might go to waste.", 
	"Buy only what he will realistically consume before the expiration date", 
	" Buy all of it and donate to a shelter."], "correct": 1},
	{"question":"After dinner, Kevin notices that his family often throws away leftovers because they forget about them in the fridge. How can Kevin help reduce food waste?",
	"image":"res://thesisProjectAssets/quiz3.png",
	"options":["Suggest eating leftovers before making a new meal.",
	"Keep throwing them away",
	"Encourage his family to cook less food."],
	"correct":2},
	{"question":"Lucas and her friends had a picnic and there are a lot of fruit slices left over. What’s the best way to store these fruits to ensure they last longer?",
	"image":"res://thesisProjectAssets/quiz4.png",
	"options":["Leave them in the picnic basket for the next day.",
	"Put them directly in the fridge without any cover.",
	" Place them in airtight containers before refrigerating"],
	"correct":2},
	{"question":" Max loves cooking but ends up with a lot of vegetable peels and scraps. What can Max do to make the most out of these scraps instead of throwing them away?",
	"image":"res://thesisProjectAssets/quiz5.png",
	"options":["Start a compost bin for gardening.",
	"Use them to make a vegetable broth.",
	"Throw them away; they're not useful."],
	"correct":1},#questions as needed
]

var current_question = 0
var score=0
@onready var score_label = $VBoxContainer/Label2
@onready var energy_bar = $VBoxContainer/HBoxContainer/VBoxContainer/TextureRect
@onready var hunger_bar = $VBoxContainer/HBoxContainer/VBoxContainer2/TextureRect2
var sprit=preload("res://subscene/spirit/spirit.tscn")

var changeScreen=preload("res://quizScenes/quizReward .tscn")


@onready var question_label = $VBoxContainer/Label

@onready var answer_button_template = $VBoxContainer/Button
@onready var question_image = $VBoxContainer/TextureRect

@onready var answer_buttons = []

func _ready():
	answer_button_template.hide()  # Hide the template button
	load_question(current_question)

func load_question(index):
	question_label.text = questions[index]["question"]
	question_image.texture = load(questions[index]["image"])  # Load and display the image
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
		$VBoxContainer.add_child(button)
		answer_buttons.append(button)

func _on_AnswerButton_pressed(index):
	var style = StyleBoxFlat.new()
	if index == questions[current_question]["correct"]:
		print("Correct answer!")
		score+=1

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

func clear_old_buttons():
	for button in answer_buttons:
		button.queue_free()  # Remove the old buttons
	answer_buttons.clear()

func complete_quiz(score):
	print(score)
	QuizScore.score=score;
	get_tree().change_scene_to_packed(changeScreen)
#	add_child(changeScreen.instantiate())

		
	
