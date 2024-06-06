extends TextureButton
@onready var recycleable = $"../TextureRect3"

@onready var appreciation = $"../Label2"
@onready var label = $Label

var decision_obj={}
var entered=false
var lang=LanguageScrnState.lang
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body is CharacterBody2D:
		LeftOversLocalStates.destinationReached="kitchen"
		decision_obj={"source":LeftOversLocalStates.source_selected, "destination":LeftOversLocalStates.destinationReached}
		entered=true

func _on_kitchen_pressed():
	if entered:
		LeftOversLocalStates.decision_list.append(decision_obj)
		recycleable.visible=false
		self.visible=false
		label.visible=false
		if LeftOversLocalStates.source_selected=="2":
			if lang=="en":
				appreciation.text="Hurrah! It's right"
			elif lang=="es":
				appreciation.text="¡Hurra! Está bien"
			elif lang=="dk":
				appreciation.text="Hurra! Det er rigtigt"
			HungerQuestState.coins+=25
		else:
			if lang=="en":
				appreciation.text="Please think again"
			elif lang=="es":
				appreciation.text="Por favor piensa de nuevo"
			elif lang=="dk":    
				appreciation.text="Tænk venligst om igen"
