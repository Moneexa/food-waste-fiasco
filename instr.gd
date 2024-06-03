extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_texture_button_pressed():
	var mainScrn=preload("res://thesisProjectAssets/main.tscn")
	get_tree().change_scene_to_packed(mainScrn)


func _on_texture_button_2_pressed():
	var instrctScrn=preload("res://kidsScene/instructions.tscn")
	get_tree().change_scene_to_packed(instrctScrn)
