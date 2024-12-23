extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.PlayerSiaga = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	GameManager.change_scene_and_save("res://Scene/SekolahScene.tscn")
