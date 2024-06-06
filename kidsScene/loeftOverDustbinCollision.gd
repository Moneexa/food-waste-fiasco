extends TextureButton
@onready var label = $Label

@onready var appreciation = $"../Label2"
var decision_obj={}
var entered=false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body is CharacterBody2D:
		LeftOversLocalStates.destinationReached="dustbin"
		decision_obj={"source":LeftOversLocalStates.source_selected, "destination":LeftOversLocalStates.destinationReached}
		entered=true
var lang=LanguageScrnState.lang
func _on_pressed_dustbin():
	if entered:
		self.visible=false
		label.visible=false
		LeftOversLocalStates.decision_list.append(decision_obj)
		if lang=="en":
			appreciation.text="Think again, nothing should be thrown away."
		elif lang=="es":
			appreciation.text="Piénselo de nuevo, no se debe tirar nada."			
		elif lang=="dk":
			appreciation.text="Tænk igen, intet skal smides ud."			

		HungerQuestState.coins-=25
