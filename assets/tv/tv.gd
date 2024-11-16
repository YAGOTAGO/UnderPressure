extends Node3D

# Rotation range of antenna (in degrees)
const MIN_ROTATION: int = -45
const MAX_ROTATION: int = 45

#@onready var antenna: Sprite2D = %Antenna
@onready var slider: HSlider = %HSlider
@onready var tv_shader_material: ShaderMaterial = %TvShader.get_shader_material()
@onready var antenna : Node3D = %"Antenna Parent"

var target_value: int = 50 # will be number between 0 and 100
var is_broken: bool = false

#will trigger an anomaly
func activate() -> void:
	target_value = randi_range(slider.min_value, slider.max_value)
	update_tv_noise()

func _ready() -> void:
	update_rotation(slider.value)
	slider.value_changed.connect(_on_h_slider_value_changed)
	
#function that rotates antenna
func update_rotation(value: float)-> void:
	var rotation_degree: int  = MIN_ROTATION + (value / slider.max_value) * (MAX_ROTATION - MIN_ROTATION)
	antenna.rotation_degrees.z = rotation_degree
	
func update_tv_noise() -> void:
	var distance: float = abs(slider.value - target_value)
	var proximity: float = distance / slider.max_value
	
	tv_shader_material.set_shader_parameter("static_noise_intensity", lerp(0.06, 1.0, proximity))
	
	if abs(slider.value - target_value) < 5:
		is_broken = false
	
func _on_h_slider_value_changed(value: float) -> void:
	update_rotation(value)
	update_tv_noise()
	
