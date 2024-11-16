extends Node3D

@export var switchArray:Array[Node3D]

var is_broken: bool = false

func activate() -> void:
	is_broken = true
	for switch:Node3D in switchArray:
		if(randi_range(0,1) == 0):
			switch.break_switch()
		else:
			switch.set_correct()

func _process(delta: float) -> void:
	if !is_broken:
		return
		
	for switch:Node3D in switchArray:
		if switch.get_correct() == false:
			return
	
	is_broken = false
