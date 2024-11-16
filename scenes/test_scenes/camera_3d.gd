extends Camera3D

# Variables for rotation
var rotation_sensitivity: float = 0.001  # Sensitivity of mouse movement
var pitch_limit: float = 60.0           # Maximum pitch angle
var yaw_limit: float = 30.0             # Maximum yaw angle

# Track the current rotation
var current_pitch: float = 0.0
var current_yaw: float = 0.0

# Optional: for smoothness, you can use a factor for interpolation
var smooth_factor: float = 0.1

# Store the initial position for the camera, if needed
var initial_position: Vector3 = Vector3()

func _ready() -> void:
	# Optional: Set initial camera position or constraints on start
	initial_position = global_transform.origin
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)  # Captures the mouse for smooth movement

func _process(delta: float) -> void:
	var mouse_delta: Vector2 = Input.get_last_mouse_velocity()  # Get mouse movement since the last frame

	# Rotate the camera based on the mouse movement
	current_yaw -= mouse_delta.x * rotation_sensitivity
	current_pitch -= mouse_delta.y * rotation_sensitivity

	# Apply constraints on pitch and yaw
	current_pitch = clamp(current_pitch, -pitch_limit, pitch_limit)
	current_yaw = clamp(current_yaw, -yaw_limit, yaw_limit)

	# Apply the calculated rotation to the camera
	rotation_degrees.x = current_pitch
	rotation_degrees.y = current_yaw

	# Optionally, smoothly interpolate to avoid abrupt changes
	rotation_degrees.x = lerp_angle(rotation_degrees.x, current_pitch, smooth_factor)
	rotation_degrees.y = lerp_angle(rotation_degrees.y, current_yaw, smooth_factor)

	# (Optional) Apply a constraint on the camera position in the world (if needed)
	# global_transform.origin = initial_position  # For fixed position
