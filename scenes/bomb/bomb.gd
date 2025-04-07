extends RigidBody2D

@export var ship_return : Area2D
@export var score_value = 250

@onready var particals = $particals
@onready var possible_sprites = $sprites.get_children()
@onready var audio_stream_player = $AudioStreamPlayer

var held = false


func _ready():
	for sprite in possible_sprites:
		sprite.visible = false
	possible_sprites[randi() % possible_sprites.size()].visible = true		


func explode():
	audio_stream_player.play()
	particals.set_emitting(true)
	await particals.finished
	await audio_stream_player.finished
	$Area2D/CollisionShape2D.disabled = true
	queue_free()

func release():
	set_freeze_enabled(false)
	$Area2D/CollisionShape2D.disabled = false
	await get_tree().create_timer(0.5).timeout
	held = false

func hooked(grabber):
	held = true
	reparent(grabber.get_node("inventory"))
	position = Vector2.ZERO
	$Area2D/CollisionShape2D.disabled = true
	set_freeze_enabled(true)

func _on_area_2d_body_entered(body:Node2D) -> void:
	if body.name == "hook" and !held:
		if ship_return != null:
			ship_return.enable()
			hooked(body)



