extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	pass

func _ready() -> void:
	animated_sprite.play("idle")
