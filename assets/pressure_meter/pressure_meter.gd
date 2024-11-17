extends Node3D

@onready var timer: Timer = %Timer
@onready var countdown: Timer = %PressureCountdown
@onready var needle: Node3D = %MeterNeedle
@onready var boiling: AudioStreamPlayer3D = %PlayBoil
@onready var fail_sound: AudioStreamPlayer3D = %PlayFail


signal component_failed


var angle:float = 0.0	# The current angle of the needle
var MIN_ANGLE:int = 0
var MAX_ANGLE:int = 90

var scale_factor:int = 0;	# How fast the pressure gauge will go off (0 is static)
var is_compromised:bool = false # If the gauge has hit max pressure

var is_broken:bool = false

func activate() -> void:
	is_broken = true
	scale_factor = 5

func fix() -> void:
	if is_compromised:
		is_broken = false
		is_compromised = false
		angle = 0
		scale_factor = 0
		boiling.stop()
		countdown.stop()
		
func break_meter()->void:
	print("Meter component has failed...")
	is_compromised = false
	angle = 0
	scale_factor = 0
	boiling.stop()
	fail_sound.play()
	component_failed.emit()
	is_broken = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.start()	# Start the timer to move the needle


func btn_pressed() ->void:
	if is_compromised:
		fix()

func move_needle() -> void:
	needle.rotation_degrees.z = 30 -angle
	
	if angle > 80 and !is_compromised:
		#print("About to blow")
		countdown.start()
		is_compromised = true
		boiling.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.

var time_sum:float = 0.0
func _process(delta: float) -> void:
	time_sum += delta
	angle += sin(20 * time_sum)  # Rotate dynamically
	angle = max(min(MAX_ANGLE, angle), MIN_ANGLE)
	
	if time_sum > 1000:
		time_sum = 0.0
	
	move_needle()


func _on_timer_timeout() -> void:
	angle += randi_range(0, scale_factor)
	angle = max(min(MAX_ANGLE, angle), MIN_ANGLE)
	move_needle()


func _on_pressure_countdown_timeout() -> void:
	break_meter()
	
