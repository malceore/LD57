extends CharacterBody2D


@export var score: int = 250
@export var direction: float = 1.0
@export var speed: float = 156

@onready var possible_sprites = $sprites.get_children()


func _ready() -> void:
	for sprite in possible_sprites:
		sprite.visible = false
	possible_sprites[randi() % possible_sprites.size()].visible = true
	$Polygon2D.scale.x = direction

func _process(delta: float) -> void:
	position.x += speed * delta * direction

