extends Node3D

signal component_failed
@onready var timer:Timer = %Timer

@export var switchArray:Array[Node3D]
var is_broken: bool = false




func activate() -> void:
	print("activate switchboard")
	is_broken = true
	timer.start()
	$AudioStreamPlayer3D.play()
	
	for switch:Node3D in switchArray:
		if(randi_range(0,5) >= 3):
			print("break")
			switch.break_switch()
		else:
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
