extends TextureRect


@export var tab: int = 0

func _ready() -> void:
	Globals.TUTORIALS_COMPLETED += 1
	$VBoxContainer/TabContainer.set_current_tab(tab)
	if Globals.TUTORIALS_COMPLETED >= 2:
		visible = false

func _on_close_button_pressed() -> void:
	queue_free()
