extends Node3D

@onready var audio_player: AudioStreamPlayer3D = %AudioStreamPlayer3D
var is_broken = false

func activate() -> void:
	is_broken = true
	audio_player.play()

func fix() -> void:
	is_broken = false
	audio_player.stop()

func _on_area_3d_clicked() -> void:
	fix()
