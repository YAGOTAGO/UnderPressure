extends Node3D

@onready var switch: Node3D = %SwitchContainer

signal switch_toggled
var mouse_inside: bool = false

var is_up: bool = true


func activate() -> void:
	switch_toggled.emit()
	
	is_up = !is_up
	if(is_up):
		switch.rotate_x(-0.7)
	else:
		switch.rotate_x(0.7)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if mouse_inside and Input.is_action_just_pressed("click"):
		activate()



func _on_area_3d_mouse_entered() -> void:
	mouse_inside = true


func _on_area_3d_mouse_exited() -> void:
	mouse_inside = false
