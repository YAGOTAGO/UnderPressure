extends Node2D

@onready var needle: Sprite2D = $NeedleSprite
@onready var slider: HSlider = %HSlider
@onready var gadge_timer: Timer = %Timer


const MIN_ROTATION: int = -90
const MAX_ROTATION: int = 0

var needle_value: int = 0   # Will be number between -90 and 0
var max_offset: int = 10	# Determines how fast the needle moves on its own


func update_rotation(value: float)-> void:
	needle_value  = MIN_ROTATION + (value) * (MAX_ROTATION - MIN_ROTATION)
	needle.rotation_degrees = needle_value

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_rotation(slider.value)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func _on_h_slider_value_changed(value: float) -> void:
	update_rotation(value)


# Update the needle every-so often to make it jitter
func _on_timer_timeout() -> void:
	needle_value  = randi_range(max(-90 ,needle_value - max_offset), min(0, needle_value + max_offset))
	needle.rotation_degrees = needle_value
	
