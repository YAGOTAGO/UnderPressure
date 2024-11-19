extends Node3D

signal component_failed
@onready var timer:Timer = %Timer
@onready var audio:AudioStreamPlayer3D = %AudioStreamPlayer3D
@export var switchArray:Array[Node3D]
var is_broken: bool = false


func _ready():
	# Automatically populate switchArray with children of the current node
	for child in get_children():
		if child is Switch:
			switchArray.append(child)

func activate() -> void:
	print("activate switchboard")
	is_broken = true
	timer.start()
	audio.play()
	
	for switch in switchArray:
		if randi_range(0,5) >= 3:
			switch.break_switch()
		else:
			switch.set_correct()


func _process(_delta: float) -> void:
	if !is_broken:
		return
		
	for switch:Node3D in switchArray:
		if switch.get_correct() == false:
			return
	
	is_broken = false
	timer.stop()



func _on_timer_timeout() -> void:
	component_failed.emit()
