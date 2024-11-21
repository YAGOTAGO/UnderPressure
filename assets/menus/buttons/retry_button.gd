class_name Retry
extends Button

signal retry_clicked

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(func(): retry_clicked.emit())
