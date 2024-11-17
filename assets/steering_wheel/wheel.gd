extends Node3D

const MAX_ROTATION: int = 30
const MIN_ROTATION: int = -30

@onready var wheel: Node3D = %Wheel
@onready var animation_player: AnimationPlayer = %AnimationPlayer

var direction:bool

var is_broken: bool = false

signal steering_wheel_break
signal steering_wheel_fix


func activate() -> void:
	direction = randi_range(0,1) == 1
	steering_wheel_break.emit(direction)
	
func fix()->void:
	is_broken = false
	steering_wheel_fix.emit()
	
func break_wheel()->void:
	steering_wheel_fix.emit()


func _on_left_area_clicked() -> void:
	if !animation_player.is_playing():
		animation_player.play("wheel_left")
		
	if !direction:
		fix()
	else:
		break_wheel()
		
	

func _on_right_area_clicked() -> void:
	if !animation_player.is_playing():
		animation_player.play("wheel_right")
		
	if direction:
		fix()
	else:
		break_wheel()
