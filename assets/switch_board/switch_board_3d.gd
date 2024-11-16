extends Node3D


@export var switchArray:Array[Node3D]





func randomize_switches() -> void:
	for switch in switchArray:
		if(randi_range(0,1) == 0):
			switch.activate()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize_switches()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
