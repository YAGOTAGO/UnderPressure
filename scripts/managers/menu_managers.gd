class_name MenuManager
extends Node

@export var main_menu: Node3D
@export var lose_menu: Node3D
@export var win_menu: Node3D

#functions to display the menus
func display_main(display: bool) -> void:
	main_menu.visible = display
	
func display_win(display: bool) -> void:
	win_menu.visible = display
	
func display_lose(display: bool) -> void:
	lose_menu.visible = display
