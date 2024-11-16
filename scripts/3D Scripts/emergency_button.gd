extends Node3D

@onready var timer: Timer = %Timer
@onready var cover_animation: AnimationPlayer = $DropCover


var is_covered:bool = true
var mouse_in_cover:bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if mouse_in_cover and Input.is_action_just_pressed("click"):
		move_cover()
		
		
func move_cover() -> void:
	if is_covered:
		print("moving cover")
		
#		put animation here
		cover_animation.play("cover_flip")
		timer.start()
		
		is_covered = false

func _on_button_case_mouse_entered() -> void:
	mouse_in_cover = true

func _on_button_case_mouse_exited() -> void:
	mouse_in_cover = false


func _on_timer_timeout() -> void:
#	reverse animation
	is_covered = true
