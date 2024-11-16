extends MeshInstance3D

@export var viewport: SubViewport

func _ready():
	
	#viewport.ClearMode = viewport.ClearMode.CLEAR_MODE_ONCE
	
		
	# Retrieve the texture and set it to the viewport quad.
	material_override.albedo_texture = viewport.get_texture()
	
