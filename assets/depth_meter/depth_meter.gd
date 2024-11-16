extends Node

signal surface_reached

const MAX_AMOUNT = 10
const MIN_AMOUNT = 1
const START_DEPTH = 1000

@onready var progress_shader_material: ShaderMaterial = %ProgressBar.material as ShaderMaterial
@onready var label: Label = %Label

var depth_num: int = START_DEPTH

func _ready() -> void:
	_update_display()
	
func _on_timer_timeout() -> void:
	var amount: int = randi_range(MIN_AMOUNT, MAX_AMOUNT)
	depth_num -= amount
	
	if depth_num <=0:
		depth_num = 0
		surface_reached.emit()
		
	_update_display()
	
func _update_display():
	label.text = str(depth_num)
	var percentage: float = 1.0 - (depth_num as float/ START_DEPTH as float) * 2.0
	progress_shader_material.set_shader_parameter("fill_value", percentage)

	
