extends Node
var mainScrn=preload("res://instr.tscn")
var parentsScrn=preload("res://prentsScene/node.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_kid_pressed():
	get_tree().change_scene_to_packed(mainScrn)
	


func _on_parent_pressed():
	get_tree().change_scene_to_packed(parentsScrn)
