extends Node2D

@onready var switch1: Node2D = %SwitchScene1
@onready var switch2: Node2D = %SwitchScene2
@onready var switch3: Node2D = %SwitchScene3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_switch_scene_1_switch_clicked() -> void:
	print("switch 1 clicked")




func _on_switch_scene_2_switch_clicked() -> void:
	print("switch 2 clicked")
	


func _on_switch_scene_3_switch_clicked() -> void:
	print("switch 3 clicked")
