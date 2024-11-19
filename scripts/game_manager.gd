class_name GameManager
extends Node

@export var list_components: Array[Node3D]
@onready var timer: Timer = %Timer
@onready var depth: Node3D = %DepthMeter
@onready var game_over_node: Node3D = %GameOver
@onready var game_win_node: Node3D = %GameWin
@onready var window: Node3D = %Window

var num_failed_components:int = 0

func _ready() -> void:
	game_over_node.visible = false
	game_win_node.visible = false

func start_game() -> void:
	timer.start(0)
	depth.start_depth_meter()
	
func game_over()-> void:
	game_over_node.visible = true
	queue_free()
	
# Game win
func _on_depth_meter_game_win() -> void:
	game_win_node.visible = true
	queue_free()
	

func _on_timer_timeout() -> void:
	_activate_components()

func _activate_components()->void:
	#get non broken components
	
	var non_broken_components = list_components.filter(func(c): return not c.is_broken)
	
	# Check if there are any non-broken components left.
	if non_broken_components.is_empty():
		print("All components are broken!")
		return
	
	# Randomly select a component from the non-broken list.
	var random_index:int = randi() % non_broken_components.size()
	var selected_component = non_broken_components[random_index]
	
	# Set the selected component to broken.
	selected_component.is_broken = true
	selected_component.activate();
	print("Component broken:", selected_component.name)

# Listen for failed components
func on_component_fail()->void:
	if num_failed_components % 3 == 0:
		window.next_break()
		
	if num_failed_components == 9:
		game_over()

func _on_pressure_meter_component_failed() -> void:
	num_failed_components += 1
	print("meter" + str(num_failed_components))
	on_component_fail()
	

func _on_switch_board_3d_component_failed() -> void:
	num_failed_components += 1
	print("switch" + str(num_failed_components))
	on_component_fail()

	

func _on_tv_component_failed() -> void:
	num_failed_components += 1
	print("tv" + str(num_failed_components))
	on_component_fail()

	

func _on_steering_wheel_component_failed() -> void:
	num_failed_components += 1
	print("wheel" + str(num_failed_components))
	on_component_fail()

	

func _on_radar_component_failed() -> void:
	num_failed_components += 1
	print("radar" + str(num_failed_components))
	on_component_fail()

	

func _on_radio_component_failed() -> void:
	num_failed_components += 1
	print("radio" + str(num_failed_components))
	on_component_fail()

	
