extends Area2D

@onready var animated_sprite_2d = $AnimatedSprite2D

var fridge_collided=false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass




# Called every frame. 'delta' is the elapsed time since the preavious frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.name == "CharacterBody2D":
		animated_sprite_2d.play("opening")
		FridgeScript.fridge_collided=true
		 # Assuming "Main Char" is the name of your main character node



