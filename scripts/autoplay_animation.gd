extends Node

@export var animation_player: AnimationPlayer
@export var animation_name: String

func _ready() -> void:
	animation_player.play(animation_name)
