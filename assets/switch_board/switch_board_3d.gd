extends Node3D


@export var switchArray:Array[Node3D]





func activate() -> void:
	for switch in switchArray:
		if(randi_range(0,1) == 0):
			switch.break_switch()
		else:
			switch.set_correct()
			
			


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	activate()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
