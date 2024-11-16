extends MeshInstance3D

@export var viewport: SubViewport

func _ready()-> void:
	material_override.albedo_texture = viewport.get_texture()
	
