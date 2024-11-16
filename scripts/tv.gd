extends Node2D

# Rotation range (in degrees)
const MIN_ROTATION = -45
const MAX_ROTATION = 45

@onready var antenna: Sprite2D = %Antenna
@onready var slider: HSlider = %HSlider

var target_value: int = 50 # will be number between 0 and 100

func activate() -> void:
	pass
