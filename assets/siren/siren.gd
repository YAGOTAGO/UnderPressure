extends Node3D

@onready var light: SpotLight3D = %SpotLight3D
@onready var animation_player: AnimationPlayer = %AnimationPlayer

func on() -> void:
	light.light_energy = 1
	animation_player.play("light_spin")

func off() -> void:
	light.light_energy = 0
	animation_player.stop()
