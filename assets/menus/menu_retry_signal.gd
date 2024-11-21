extends Node2D

signal retry

func _on_retry_clicked() -> void:
	retry.emit()
