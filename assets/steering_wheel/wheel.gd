extends Node3D

const MAX_ROTATION: int = 30
const MIN_ROTATION: int = -30

@onready var wheel: Node3D = %Wheel
@onready var animation_player: AnimationPlayer = %AnimationPlayer

var is_broken: bool = false

signal steering_wheel_break

func activate() -> void:
	steering_wheel_break.emit()
	

func _on_left_area_clicked() -> void:
	if !animation_player.is_playing():
		animation_player.play("wheel_left")

func _on_right_area_clicked() -> void:
	if !animation_player.is_playing():
		animation_player.play("wheel_right")
