extends Node3D

# Rotation range of antenna (in degrees)
const MIN_ROTATION: int = -45
const MAX_ROTATION: int = 45

const OFFSET: int = 32

@onready var timer: Timer = %Timer

@onready var slider: HSlider = %HSlider
@onready var tv_shader_material: ShaderMaterial = %TvShader.get_shader_material()
@onready var antenna : Node3D = %"Antenna Parent"
@onready var staticSound : AudioStreamPlayer3D = %StaticSound
@onready var animation_player: AnimationPlayer = %AnimationPlayer
@onready var tv_image : Node2D = %TvShader

signal component_failed

var target_value: int = 50 # will be number between 0 and 100
var is_broken: bool = false

#will trigger an anomaly
func activate() -> void:
	target_value = randi_range(slider.min_value as int, slider.max_value as int)
	update_tv_noise()
	timer.start(0)
	
	
func fix() -> void:
	animation_player.play("green_light")
	is_broken = false
	timer.stop()
	
func break_tv()->void:
	component_failed.emit()
	is_broken = true
	animation_player.play("red_light")

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
	
#	Audio settings for the static
	var volume:float = proximity * 10
	#if proximity < 0.06:
	
	if abs(slider.value - target_value) < OFFSET:
		print("TV FIXED")
		volume = -50.0
		fix()
	
	staticSound.volume_db = volume

func _on_h_slider_value_changed(value: float) -> void:
	update_rotation(value)
	update_tv_noise()
	


func _on_steering_wheel_steering_wheel_break(direction:bool) -> void:
	if direction:
		tv_image.show_right(true)
	else:
		tv_image.show_left(true)


func _on_steering_wheel_steering_wheel_fix() -> void:
	tv_image.hide_image()


func _on_timer_timeout() -> void:
	break_tv()
