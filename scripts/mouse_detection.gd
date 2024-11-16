extends Area3D

signal clicked
var mouse_inside: bool = false

func _ready() -> void:
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)

func _process(_delta: float) -> void:
	if mouse_inside and Input.is_action_just_pressed("click"):
		clicked.emit()
		print("clicked")

func _on_mouse_entered() -> void:
	mouse_inside = true
	print("mouse entered")

func _on_mouse_exited() -> void:
	mouse_inside = false
	print("mouse exited")
