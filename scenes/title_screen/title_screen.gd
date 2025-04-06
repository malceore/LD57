extends Node2D

signal start_game_pressed

func _on_button_pressed() -> void:
	start_game_pressed.emit()
