extends Node3D

#offset for blip
const MIN_VAL: float = -0.5
const MAX_VAL: float = 0.5

@onready var radar_shader_material: ShaderMaterial = %Radar.get_shader_material()
@onready var area: Area3D = %Area3D
var is_broken: bool = false

func _ready() -> void:
	area.connect("clicked", fix)
	activate()
	
func activate() -> void:
	var rand_x: float = randf_range(MIN_VAL, MAX_VAL)
	var rand_y: float = randf_range(MIN_VAL, MAX_VAL)
	
	radar_shader_material.set_shader_parameter("blip_position", Vector2(rand_x, rand_y))
	radar_shader_material.set_shader_parameter("show_blip", true)
	is_broken = true

func fix() -> void:
	radar_shader_material.set_shader_parameter("show_blip", false)
	is_broken = false
