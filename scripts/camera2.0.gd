extends Camera3D

var rotation_sensitivity: float = 0.01 
var pitch_limit: float = 60.0           
var yaw_limit: float = 30.0            

var current_pitch: float = 0.0
var current_yaw: float = 0.0
var smooth_factor: float = 0.1
var initial_position: Vector3 = Vector3()

func _ready() -> void:
	initial_position = global_transform.origin

func _process(_delta: float) -> void:
	# Get the center of the screen
	var screen_size: Vector2 = DisplayServer.window_get_size()
	var screen_center: Vector2 = screen_size / 2
	
	# Get the mouse position
	var mouse_position: Vector2 = DisplayServer.mouse_get_position()
	
	# Calculate the offset from the center
	var offset: Vector2 = mouse_position - screen_center
	
	# Rotate the camera based on the offset
	current_yaw = -offset.x * rotation_sensitivity
	current_pitch = -offset.y * rotation_sensitivity
	
	# Apply constraints on pitch and yaw
	current_pitch = clamp(current_pitch, -pitch_limit, pitch_limit)
	current_yaw = clamp(current_yaw, -yaw_limit, yaw_limit)
	
	# Smoothly interpolate to avoid abrupt changes
	rotation_degrees.x = lerp_angle(rotation_degrees.x, current_pitch, smooth_factor)
	rotation_degrees.y = lerp_angle(rotation_degrees.y, current_yaw, smooth_factor)

	# (Optional) Keep the camera position fixed in the world
	global_transform.origin = initial_position  # For fixed position
