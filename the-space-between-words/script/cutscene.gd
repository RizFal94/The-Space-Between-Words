extends Node2D


func _ready():
	var animation_player = $AnimationPlayer
	animation_player.play("scene1")
	animation_player.connect("animation_finished", Callable(self, "_on_animation_finished"))

func _on_animation_finished(anim_name: String):
	GameManager.change_scene_and_save("res://Scene/KelasScene.tscn")
