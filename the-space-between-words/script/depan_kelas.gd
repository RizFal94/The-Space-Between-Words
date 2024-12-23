extends Node2D

@onready var dialogue_area = $AreaDialog
var player_in_area = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_pindah_body_entered(body: Node2D) -> void:
	GameManager.change_scene_and_save("res://Scene/DepanKelasTarung.tscn")

#func _on_area_dialog_body_entered(body: Node) -> void:
	#if body.is_in_group("Player"):  
		#player_in_area = true
		#run_dialogue("Galang_taunt")
#
#func _on_area_dialog_body_exited(body):
	#if body.is_in_group("Player"): 
		#player_in_area = false
#
#func run_dialogue(dialogue_string: String) -> void:
	#Dialogic.start(dialogue_string)
	#print("Dialog dimulai:", dialogue_string)
	
