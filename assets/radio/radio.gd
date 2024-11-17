extends Node3D

@onready var audio_player: AudioStreamPlayer3D = %AudioStreamPlayer3D
@onready var animaitons: AnimationPlayer = %AnimationPlayer

var is_broken = false


func activate() -> void:
	is_broken = true
	audio_player.play()
	animaitons.play("play_music")

func fix() -> void:
	is_broken = false
	audio_player.stop()
	animaitons.stop(false)



var mouse_right:bool = false
var mouse_left:bool = false

func turn_left() ->void:
	print("left clicked")
	fix()

	
func turn_right() ->void:
	print("right clicked")
	fix()
	


func _process(_delta: float) -> void:
	if mouse_right and Input.is_action_just_pressed("click"):
		turn_right() 
		
	if mouse_left and Input.is_action_just_pressed("click"):
		turn_left() 
		

# Mouse collision logic
func _on_left_hitbox_mouse_entered() -> void:
	mouse_left = true

func _on_left_hitbox_mouse_exited() -> void:
	mouse_left = false

func _on_right_hitbox_mouse_entered() -> void:
	mouse_right = true

func _on_right_hitbox_mouse_exited() -> void:
	mouse_right = false
