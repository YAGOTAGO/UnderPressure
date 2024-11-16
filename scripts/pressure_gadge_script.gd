extends Node2D

@onready var needle: Sprite2D = $NeedleSprite

const MIN_ROTATION: int = 0
const MAX_ROTATION: int = 90

var needle_value: int = 0 # will be number between 0 and 100



func update_rotation(value: float)-> void:
	var rotation: int  = MIN_ROTATION + (value / 100.0) * (MAX_ROTATION - MIN_ROTATION)
	needle.rotation_degrees = rotation

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_mouse_entered() -> void:
	update_rotation(1)
