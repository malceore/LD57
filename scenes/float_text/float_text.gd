extends Node2D

@onready var float_text = get_node("RichTextLabel")

var boiler_plate = "[center]"

func _ready() -> void:
    $AnimationPlayer.play("hide")

func reveal(text):
    $RichTextLabel.text = text
    $AnimationPlayer.play("reveal")