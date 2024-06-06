extends Node
@onready var texture_button = $TextureButton
@onready var texture_button_2 = $TextureButton2

var lang=LanguageScrnState.lang
# Called when the node enters the scene tree for the first time.
func _ready():
	if lang=="en":
		texture_button.texture_normal=load("res://thesisProjectAssets/startButton.PNG")
		texture_button_2.texture_normal=load("res://thesisProjectAssets/instrc.PNG")
	elif lang=="es":
		texture_button.texture_normal=load("res://thesisProjectAssets/startButton_es.PNG")			
		texture_button_2.texture_normal=load("res://thesisProjectAssets/instrc_es.PNG")
	elif lang=="dk":
		texture_button.texture_normal=load("res://thesisProjectAssets/startButton.PNG")			
		texture_button_2.texture_normal=load("res://thesisProjectAssets/instrc_dk.png")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_texture_button_pressed():
	var mainScrn=preload("res://thesisProjectAssets/main.tscn")
	get_tree().change_scene_to_packed(mainScrn)


func _on_texture_button_2_pressed():
	var instrctScrn=preload("res://kidsScene/instructions.tscn")
	get_tree().change_scene_to_packed(instrctScrn)
