extends Area2D

signal area_clicked
var mouse_inside: bool = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if mouse_inside and Input.is_action_just_pressed("click"):
		area_clicked.emit()


func _on_mouse_entered() -> void:
	mouse_inside = true


func _on_mouse_exited() -> void:
	mouse_inside = false
