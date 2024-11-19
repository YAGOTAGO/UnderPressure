extends Node3D

@onready var audio_player: AudioStreamPlayer3D = %AudioStreamPlayer3D
@onready var animations: AnimationPlayer = %AnimationPlayer

signal component_failed
@onready var timer:Timer = %Timer

var is_broken: bool = false

func activate() -> void:
	is_broken = true
	audio_player.play()
	animations.play("play_music")
	timer.start(0)

func fix() -> void:
	is_broken = false
	audio_player.stop()
	animations.stop()
	timer.stop()


func break_radio()->void:
	component_failed.emit()

func _on_timer_timeout() -> void:
	break_radio()

func _on_hitbox_clicked() -> void:
	fix()
