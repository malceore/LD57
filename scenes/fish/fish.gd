extends CharacterBody2D


@export var score: int = 250
@export var direction: float = 1.0
@export var speed: float = 156


func _ready() -> void:
	#$AnimatedSprite2D.flip_h = direction < 0
	$Polygon2D.scale.x = direction

func _process(delta: float) -> void:
	position.x += speed * delta * direction

# func _on_area_2d_body_entered(body:Node2D) -> void:
# 	if body.name == "hook":
# 		Globals.SCORE += score
# 		queue_free()
