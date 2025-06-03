extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$QuestionLabel.text = "vuoi un gelato?"
	$ChoicesContainer/ChoiceButton1.text = "sì"
	$ChoicesContainer/ChoiceButton2.text = "no"
	$ChoicesContainer/ChoiceButton3.text = "non lo so"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
