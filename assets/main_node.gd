extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var dialog_container_scene = load("res://assets/dialog_container.tscn")
	var dialog = dialog_container_scene.instantiate()
	#dialog.getNode("DialogContainer/ChoicesContainer/ChoiceButton1").pressed.connect(on_press_event)
	dialog.connect("button1_pressed", on_press_event)
	add_child(dialog)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func on_press_event() -> void:
	print("ciao mondo!")
	pass
