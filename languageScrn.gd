extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_eng_pressed():
	var startScrn=preload("res://startScrn.tscn")
	get_tree().change_scene_to_packed(startScrn)


func _on_texture_button_2_pressed():
	var scrn=preload("res://spanishScenes/main-es.tscn")
	get_tree().change_scene_to_packed(scrn)
