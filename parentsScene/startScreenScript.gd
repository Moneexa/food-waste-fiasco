extends Node
@onready var heading = $Label

@onready var line_edit = $Control/LineEdit
@onready var error_label = $Control/Label
@onready var button = $Control/Button

var menu_scene=preload("res://prentsScene/menuScene.tscn")
var lang=LanguageScrnState.lang
# Called when the node enters the scene tree for the first time.
func _ready():
	if lang=="en":
		button.text="Submit"
		heading.text="Write Your Parent Pin"
	elif lang=="es":
		button.text="Entregar"
		heading.text="Escribe tu PIN de padre"
	elif lang=="dk":
		button.text="Indsend"
		heading.text="Skriv din forældrepinkode"
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_line_edit_text_changed(new_text):
	var filtered = ""
	for c in new_text:
		if filtered.length() < 4:  # Assuming a PIN length of 4
			filtered += c
	line_edit.text = filtered


func _on_button_pressed():
	if line_edit.text!="1234":
		error_label.visible=true;
	else:
		get_tree().change_scene_to_packed(menu_scene)
		
		
		
