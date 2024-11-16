extends Node

const MAX_AMOUNT = 10
const MIN_AMOUNT = 1
const START_DEPTH = 10000

@onready var progress_shader_material: ShaderMaterial = %ProgressBar.material as ShaderMaterial
@onready var label: Label = %Label

var depth_num: int = START_DEPTH

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_update_display()
	
func _on_timer_timeout() -> void:
	var amount: int = randi_range(MIN_AMOUNT, MAX_AMOUNT)
	depth_num -= amount
	_update_display()
	
func _update_display():
	label.text = str(depth_num)
	var percentage: float = 1 - (depth_num as float / START_DEPTH as float)
	progress_shader_material.set_shader_parameter("progress", percentage)

	
