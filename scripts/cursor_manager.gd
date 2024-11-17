extends Node

@export var cursor: Texture2D
@export var cursor_down: Texture2D

func _ready() -> void:
	Input.set_custom_mouse_cursor(cursor)

func _input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			Input.set_custom_mouse_cursor(cursor_down)
		else:
			Input.set_custom_mouse_cursor(cursor)
