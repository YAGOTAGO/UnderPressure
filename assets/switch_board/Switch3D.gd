extends Node3D

@onready var switch: Node3D = %SwitchContainer
@onready var light: MeshInstance3D = %IndicatorLight
@onready var audio: AudioStreamPlayer3D =%AudioStreamPlayer3D

signal switch_toggled
var mouse_inside: bool = false

var is_up: bool = true
var is_correct: bool = false


func break_switch() -> void:
	is_correct = randi_range(0,1) == 0
	is_up = !is_correct
	
	var mat = light.get_surface_override_material(0)
	mat.emission = Color(0.0, 0.0, 0.0)
	light.set_surface_override_material(0, mat)
	
	if(is_up):
		switch.rotation_degrees.x = -32
	else:
		switch.rotation_degrees.x = 32
	
	
func set_correct() -> void:
	is_correct = is_up

func _ready() -> void:
	var mat = light.get_surface_override_material(0)
	light.set_surface_override_material(0, mat.duplicate())


func activate() -> void:
	switch_toggled.emit()
	audio.play(0)
	is_up = !is_up
	
	
	if(is_up):
		switch.rotate_x(-1.5)
		
	else:
		switch.rotate_x(1.5)
		
		
	if(is_up == is_correct):
		var mat = light.get_surface_override_material(0)
		mat.emission = Color(0.84, 0.0, 0.0)
		light.set_surface_override_material(0, mat)
	else:
		var mat = light.get_surface_override_material(0)
		mat.emission = Color(0.0, 0.0, 0.0)
		light.set_surface_override_material(0, mat)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if mouse_inside and Input.is_action_just_pressed("click"):
		activate()



func _on_area_3d_mouse_entered() -> void:
	mouse_inside = true


func _on_area_3d_mouse_exited() -> void:
	mouse_inside = false
