extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_area_2d_body_entered(body: Node2D) -> void:
	GameManager.change_scene_and_save("res://Scene/SekolahMalamBanget.tscn")


func run_dialogue(dialogue_string: String) -> void:
	Dialogic.start(dialogue_string)
	print("Dialog dimulai:", dialogue_string)


func _on_area_2d_2_body_entered(body: Node2D) -> void:
	GameManager.change_scene_and_save("res://Scene/RumahScene.tscn")
