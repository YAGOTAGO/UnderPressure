extends Node3D

signal component_failed
@onready var timer:Timer = %Timer
@onready var audio:AudioStreamPlayer3D = %AudioStreamPlayer3D
@export var switchArray:Array[Node3D]
var is_broken: bool = false


func _ready():
	# Automatically populate switchArray with children of the current node
	for child in get_children():
		if child is Node3D and child is not MeshInstance3D and child is not AudioStreamPlayer3D:
			switchArray.append(child)

func activate() -> void:
	print("activate switchboard")
	is_broken = true
	timer.start()
	audio.play()
	print(switchArray.is_empty())
	
	for switch in switchArray:
		print("switch")
		if randi_range(0,5) >= 3:
			print("break")
			switch.break_switch()
		else:
			print("break2")
			
			switch.set_correct()
			
			
func break_switches()->void:
	component_failed.emit()


func _process(delta: float) -> void:
	if !is_broken:
		return
		
	for switch:Node3D in switchArray:
		if switch.get_correct() == false:
			return
	
	is_broken = false
	timer.stop()



func _on_timer_timeout() -> void:
	break_switches()
