extends Node3D

signal game_over

@onready var phase0: MeshInstance3D = %Windowphase0
@onready var phase1: MeshInstance3D = %Windowphase1
@onready var phase2: MeshInstance3D = %Windowphase2
@onready var phase3: MeshInstance3D = %Windowphase3

var curr_phase: int = 0

func _ready() -> void:
	phase0.visible = true
	phase1.visible = false
	phase2.visible = false
	phase3.visible = false

func next_break()-> void:
	match curr_phase:
		0:
			phase0.visible = false
			phase1.visible = true
			curr_phase+=1
		1:
			phase1.visible = false
			phase2.visible = true
			curr_phase+=1
		2:
			phase2.visible = false
			phase3.visible = true
			curr_phase+=1
		_:
			game_over.emit()
