extends WorldEnvironment

@export var sky_shader: ShaderMaterial

#values that represent shade of blue
const START_VALUE: float = 0.185
const END_VALUE: float = 0.5

func _ready() -> void:
	_set_sky_blue(START_VALUE)

func _set_sky_blue(blue_value: float) -> void:
	var color: Color = sky_shader.get_shader_parameter("sky_color")
	color.b = blue_value
	sky_shader.set_shader_parameter("sky_color", color)
	

func _on_depth_meter_percentage_up(percent: float) -> void:
	_set_sky_blue(START_VALUE + (END_VALUE - START_VALUE) * clamp(percent, 0.0, 1.0))
