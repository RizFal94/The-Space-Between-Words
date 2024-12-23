extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D

var gravity = 900

func _ready() -> void:
	animated_sprite.play("idle")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
