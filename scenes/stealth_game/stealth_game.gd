extends Node2D
signal dive(location)

func _on_ship_dive(location) -> void:
	dive.emit(location)
