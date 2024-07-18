extends Area2D

@onready var sprite_2d = $Sprite2D

var lang=LanguageScrnState.lang
# Assuming the Sprite is named "Icon"
func _on_body_entered(body):
	if body.name == "CharacterBody2D":  # Assuming "Main Char" is the name of your main character node
		# Perform your action here
		print("Main Char has collided with the quiz icon.")
		HungerQuestState.btnVisibility=true
		sprite_2d.visible=false
		# This could be anything, like starting a quiz, opening a dialogue, etc.

func _ready():
	if lang=="en":
		sprite_2d.play("default")
	elif lang=="es":
		sprite_2d.play("spanish")
	elif lang=="dk":
		sprite_2d.play("danish")
	connect("body_entered",Callable(self._on_body_entered))
