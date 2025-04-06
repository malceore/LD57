extends TextureRect


@export var tab: int = 0

func _ready() -> void:
	$VBoxContainer/TabContainer.set_current_tab(tab)

func _on_close_button_pressed() -> void:
	queue_free()
