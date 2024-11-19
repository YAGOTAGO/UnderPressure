class_name Switch
extends Node3D

const BROKEN_COLOR: Color = Color(0.0, 0.0, 0.0)
const WORKING_COLOR: Color = Color(.95, 0.0, 0.0)

@onready var switch: Node3D = %SwitchContainer
@onready var light: MeshInstance3D = %IndicatorLight
@onready var audio: AudioStreamPlayer3D =%AudioStreamPlayer3D

signal switch_toggled

var is_up: bool = true
var is_correct: bool = false

func _ready() -> void:
	#so each switch material is unique
	var mat = light.get_surface_override_material(0)
	light.set_surface_override_material(0, mat.duplicate())
	_set_light_emission(WORKING_COLOR)
	

func break_switch() -> void:
	is_correct = randi_range(0,1) == 0
	is_up = !is_correct
	
	_set_light_emission(BROKEN_COLOR)
	
	if(is_up):
		switch.rotation_degrees.x = -32
	else:
		switch.rotation_degrees.x = 32
	
	
func set_correct() -> void:
	is_correct = is_up

func get_correct() -> bool:
	return is_correct == is_up

func activate() -> void:
	switch_toggled.emit()
	audio.play(0)
	is_up = !is_up
	
	
	if(is_up):
		switch.rotate_x(-1.5)
		
	else:
		switch.rotate_x(1.5)
		
	if(is_up == is_correct):
		_set_light_emission(WORKING_COLOR)
	else:
		_set_light_emission(BROKEN_COLOR)
	

func _set_light_emission(color: Color) -> void:
	var mat = light.get_surface_override_material(0)
	mat.emission = color
	light.set_surface_override_material(0, mat)

func _on_area_3d_clicked() -> void:
	activate()
