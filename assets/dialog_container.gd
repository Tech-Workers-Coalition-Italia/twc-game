extends VBoxContainer

signal button1_pressed

var questions = read_questions()
var questions_number = questions["questions"].size()
var questions_counter = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for q in questions["questions"]:
		print(q["question"]["text"])
		
	var question = next_question()
	match typeof(question):
		TYPE_DICTIONARY:
			$QuestionLabel.text = question["question"]["text"]
			$ChoicesContainer/ChoiceButton1.text = question["answers"][0]["text"]
			$ChoicesContainer/ChoiceButton2.text = question["answers"][1]["text"]
			$ChoicesContainer/ChoiceButton3.text = question["answers"][2]["text"]
	
			$ChoicesContainer/ChoiceButton1.pressed.connect(on_press_event)
	
	#config.set_value("Player.Features.Stats", "hp", 100)
	#config.save("res://assets/questions.cfg")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func on_press_event() -> void:
	print("hello world!")
	$ValueBar/TextureProgressBar.value += 1
	button1_pressed.emit()
	pass

func next_question() -> Variant:
	if questions_counter >= questions_number:
		return "questions terminated"
	var res = questions["questions"][questions_counter]
	questions_counter += 1
	return res

func read_questions() -> Dictionary:
	var file = FileAccess.open("res://questions.json", FileAccess.READ)
	var content = file.get_as_text()
	
	var json = JSON.new()
	var _res = json.parse(content)
	
	return json.data
