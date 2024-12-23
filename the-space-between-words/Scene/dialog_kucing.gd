extends Area2D

var tampilInteraksi = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Label.visible = tampilInteraksi
	
	if tampilInteraksi && Input.is_action_just_pressed("interact"):
		run_dialogue("kucingNgobrol")

func _on_body_entered(body: Node2D) -> void:
	if body is Player: tampilInteraksi = true

func _on_body_exited(body: Node2D) -> void:
	if body is Player: tampilInteraksi = false

func run_dialogue(dialogue_string: String) -> void:
	Dialogic.start(dialogue_string)
	print("Dialog dimulai:", dialogue_string)
