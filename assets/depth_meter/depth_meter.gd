extends Node

@onready var progress_shader_material: ShaderMaterial = %ProgressBar.material as ShaderMaterial
@onready var label: Label = %Label

var depth_num: int = 10000

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	progress_shader_material.set_shader_parameter("progress", 0)
	label.text = str(depth_num)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
