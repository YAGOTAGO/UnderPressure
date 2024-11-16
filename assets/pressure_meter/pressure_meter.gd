extends Node3D

@onready var timer: Timer = %Timer
@onready var needle: Node3D = %MeterNeedle
@onready var animations: AnimationPlayer = %AnimationPlayer
var angle:int = 0

var MIN_ANGLE:int = 0
var MAX_ANGLE:int = 90


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#animations.get_animation("needle_low").loop = true
	
	#animations.play("needel_low")
	timer.start()
	pass

func move_needle() -> void:
	needle.rotation_degrees.z = 30 -angle

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
		animations.play("needel_low")


func _on_timer_timeout() -> void:
	angle += randi_range(0,10)
	print("Timer")
	#angle += 10
	move_needle()
	
	
