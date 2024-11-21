extends Button

signal retry_clicked

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("RETRY")
	pressed.connect(func(): retry_clicked.emit())
