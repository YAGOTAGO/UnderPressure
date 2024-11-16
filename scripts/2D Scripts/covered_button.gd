extends Node2D
@onready var btn: Sprite2D = %Button
@onready var cover: Sprite2D = %Cover
@onready var timer: Timer = %Timer


var is_covered: bool = true
var mouse_in_cover: bool = false
var mouse_in_btn: bool = false


signal covered_btn_clicked

# Emit a signal that the button was pressed
func activate() ->void:
	print("emit pressed")
	covered_btn_clicked.emit()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_covered:
		if mouse_in_cover and Input.is_action_just_pressed("click"):
			move_cover()
	else:
		if mouse_in_btn and Input.is_action_just_pressed("click"):
			activate()

# Move the button's cover and set a timer to re-cover it
func move_cover() -> void:
	if is_covered:
		cover.position += Vector2(0, -60)
		timer.start()
		
	is_covered = false


# Listen for mouse entering the cover's collision 
func _on_cover_area_mouse_entered() -> void:
	mouse_in_cover = true

func _on_cover_area_mouse_exited() -> void:
	mouse_in_cover = false

# Listen for mouse entering the button's collision 
func _on_button_area_mouse_entered() -> void:
	mouse_in_btn = true

func _on_button_area_mouse_exited() -> void:
	mouse_in_btn = false

# Timer to replace the cover over the button
func _on_timer_timeout() -> void:
	cover.position += Vector2(0, 60)
	is_covered = true
