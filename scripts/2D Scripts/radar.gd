extends Node2D

@onready var animation: AnimationPlayer = %AnimationPlayer
@onready var radar_shader_material: ShaderMaterial = %BG.material as ShaderMaterial


func activate() -> void:
	radar_shader_material.set_shader_parameter("show_blip", true)

func fix() -> void:
	radar_shader_material.set_shader_parameter("show_blip", false)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation.play("radar_cycle")
	activate()

func _on_area_3d_clicked() -> void:
	fix()
