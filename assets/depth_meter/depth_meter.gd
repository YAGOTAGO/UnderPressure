extends Node

signal surface_reached

const MAX_AMOUNT: int = 10 #max amount can climb
const MIN_AMOUNT: int = 1 #min amount can climb
const START_DEPTH: int = 5000

@onready var progress_shader_material: ShaderMaterial = %ProgressBar.material as ShaderMaterial
@onready var label: Label = %Label
@onready var timer: Timer = %Timer

var depth_num: int = START_DEPTH

func _ready() -> void:
	_update_display()
	
func start_timer() -> void:
	timer.start(0)
	
func _on_timer_timeout() -> void:
	var amount: int = randi_range(MIN_AMOUNT, MAX_AMOUNT)
	depth_num -= amount
	
	if depth_num <=0:
		depth_num = 0
		surface_reached.emit()
		
	_update_display()
	
func _update_display() -> void:
	label.text = str(depth_num)
	var percentage: float = 1.0 - (depth_num as float/ START_DEPTH as float) * 2.0
	progress_shader_material.set_shader_parameter("fill_value", percentage)

	
