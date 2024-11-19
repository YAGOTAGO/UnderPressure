extends Node3D

@onready var wheel: Node3D = %Wheel
@onready var animation_player: AnimationPlayer = %AnimationPlayer
@onready var timer: Timer = %Timer

signal component_failed

var direction: bool

var is_broken: bool = false

signal steering_wheel_break
signal steering_wheel_fix


func activate() -> void:
	direction = randi_range(0,1) == 1
	steering_wheel_break.emit(direction)
	timer.start(0)
	
	
func fix()->void:
	is_broken = false
	steering_wheel_fix.emit()
	timer.stop()

	
func break_wheel()->void:
	steering_wheel_fix.emit()
	component_failed.emit()
	is_broken = false
	

func _on_left_area_clicked() -> void:
	if !animation_player.is_playing():
		animation_player.play("wheel_left")
		
	if !direction:
		fix()
	elif is_broken:
		break_wheel()
		
	

func _on_right_area_clicked() -> void:
	if !animation_player.is_playing():
		animation_player.play("wheel_right")
		
	if direction:
		fix()
	elif is_broken:
		break_wheel()


func _on_timer_timeout() -> void:
	break_wheel()
