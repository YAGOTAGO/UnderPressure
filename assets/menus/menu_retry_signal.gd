extends Node
signal retry

func _on_retry_clicked() -> void:
	retry.emit()
