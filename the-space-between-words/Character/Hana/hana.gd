extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D

const GRAVITY = 800.0

func _ready() -> void:
	animated_sprite.play("idle")
