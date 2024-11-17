class_name GameManager
extends Node

@export var list_components: Array[Node3D]

func start_game() -> void:
	pass

func _on_timer_timeout() -> void:
	_activate_components()

func _activate_components()->void:
	#get non broken components
	print(list_components[1].is_broken)
	
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


func _on_emergency_button_emergency_btn_clicked() -> void:
	$"../PressureMeter".fix()
