extends Node3D

@onready var switch: Node3D = %SwitchContainer
@onready var audio: AudioStreamPlayer3D =%AudioStreamPlayer3D

signal switch_toggled
var mouse_inside: bool = false

var is_up: bool = true


func activate() -> void:
	switch_toggled.emit()
	audio.play(0)
	is_up = !is_up
	if(is_up):
		switch.rotate_x(-1.5)
	else:
		switch.rotate_x(1.5)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if mouse_inside and Input.is_action_just_pressed("click"):
		activate()



func _on_area_3d_mouse_entered() -> void:
	mouse_inside = true


func _on_area_3d_mouse_exited() -> void:
	mouse_inside = false