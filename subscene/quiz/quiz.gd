extends Area2D
@onready var sprite_2d = $Sprite2D

const CANVAS_LAYER = preload("res://quizScenes/canvas_layer.tscn")

var lang=LanguageScrnState.lang
		
	
# Assuming the Sprite is named "Icon"
func _on_body_entered(body):
	if body.name == "CharacterBody2D":  # Assuming "Main Char" is the name of your main character node
		# Perform your action here
		print("Main Char has collided with the quiz icon.")
		get_tree().change_scene_to_packed(CANVAS_LAYER)


		# This could be anything, like starting a quiz, opening a dialogue, etc.

func _ready():
	if lang=="en":
		sprite_2d.play("en")
	elif lang=="es":
		sprite_2d.play("es")
	elif lang=="dk":
		sprite_2d.play("dk")
	
	connect("body_entered",Callable(self._on_body_entered))
