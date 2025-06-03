extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var dialog_container_scene = load("res://dialog_container.tscn")
	var dialog = dialog_container_scene.instantiate()
	add_child(dialog)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
