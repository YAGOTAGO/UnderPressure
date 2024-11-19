extends Node3D

@onready var light: SpotLight3D = %SpotLight3D
@onready var animation_player: AnimationPlayer = %AnimationPlayer
@onready var node: Node3D = %"Siren Mesh"

var mesh_instance: MeshInstance3D
@onready var material: StandardMaterial3D = StandardMaterial3D.new()

func _ready() -> void:
	mesh_instance = node.get_child(0)

func on() -> void:
	light.light_energy = 1
	animation_player.play("light_spin")
	material.emission = Color(2, 0, 0)
	mesh_instance.set_surface_override_material(0, material)

func off() -> void:
	light.light_energy = 0
	animation_player.stop()
	material.emission = Color(0, 0, 0)
	mesh_instance.set_surface_override_material(0, material)
