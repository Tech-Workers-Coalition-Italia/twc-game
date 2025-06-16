extends VBoxContainer

signal button1_pressed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$QuestionLabel.text = "vuoi un gelato?"
	$ChoicesContainer/ChoiceButton1.text = "sì"
	$ChoicesContainer/ChoiceButton2.text = "no"
	$ChoicesContainer/ChoiceButton3.text = "non lo so"
	
	$ChoicesContainer/ChoiceButton1.pressed.connect(on_press_event)
	
	#config.set_value("Player.Features.Stats", "hp", 100)
	#config.save("res://assets/questions.cfg")
	var questions = read_questions()
	for k in questions.keys():
		print(questions[k])

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func on_press_event() -> void:
	print("hello world!")
	button1_pressed.emit()
	pass

func read_questions() -> Dictionary:
	var file = FileAccess.open("res://questions.json", FileAccess.READ)
	var content = file.get_as_text()
	
	var json = JSON.new()
	var _res = json.parse(content)
	
	return json.data
