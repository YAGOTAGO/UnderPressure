extends Node2D

# The current state of the switch
signal switch_clicked

var is_triggered: bool = false
var mouse_inside: bool = false

func activate() -> void:
	is_triggered = ! is_triggered
	
	if is_triggered:
		# Change the light icon to emit light
		$LightSprite.modulate = Color(1.5, 1.5, 1.5)
	else:
		$LightSprite.modulate = Color(0, 0, 0)
	
	switch_clicked.emit()


func _process(delta: float) -> void:
	if mouse_inside and Input.is_action_just_pressed("click"):
		activate()

func _on_area_2d_mouse_entered() -> void:
	mouse_inside = true


func _on_area_2d_mouse_exited() -> void:
	mouse_inside = false
