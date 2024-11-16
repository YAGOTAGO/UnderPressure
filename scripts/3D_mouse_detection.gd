extends Area3D

signal clicked
var mouse_inside: bool = false

func _process(delta: float) -> void:
	if mouse_inside and Input.is_action_just_pressed("click"):
		clicked.emit()
		print("clicked")

func _on_mouse_entered() -> void:
	mouse_inside = true

func _on_mouse_exited() -> void:
	mouse_inside = false
