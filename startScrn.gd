extends Node
var mainScrn=preload("res://instr.tscn")
var parentsScrn=preload("res://prentsScene/node.tscn")
@onready var label = $Label
@onready var texture_button_2 = $TextureButton2
@onready var texture_button = $TextureButton

# Called when the node enters the scene tree for the first time.
func _ready():
	if LanguageScrnState.lang=="en":
		label.text="Play the game as a"
		texture_button_2.texture_normal=load("res://thesisProjectAssets/parentsAssets/parentBtn.PNG")
		texture_button.texture_normal=load("res://thesisProjectAssets/parentsAssets/kidButton.PNG")
	elif LanguageScrnState.lang=="es":
		label.text="Juega el juego como un"
		texture_button_2.texture_normal=load("res://thesisProjectAssets/parentsAssets/padresBtn.png")			
		texture_button.texture_normal=load("res://thesisProjectAssets/parentsAssets/kisButton_es.png")
	elif LanguageScrnState.lang=="dk":
		label.text="Spil spillet som en"
		texture_button_2.texture_normal=load("res://thesisProjectAssets/parentsAssets/parentsBtn-dk.png")			
		texture_button.texture_normal=load("res://thesisProjectAssets/parentsAssets/kisButton_dk.png")
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_kid_pressed():
	get_tree().change_scene_to_packed(mainScrn)
	


func _on_parent_pressed():
	get_tree().change_scene_to_packed(parentsScrn)
