extends Node

signal pause_state_changed(is_paused: bool)

var is_paused: bool = false
@onready var canvas_layer = $CanvasLayer
@onready var pause_menu = $CanvasLayer/PauseMenu
@onready var resume_button = $CanvasLayer/PauseMenu/ColorRect/MarginContainer/VBoxContainer/ResumeButton
@onready var settings_button = $CanvasLayer/PauseMenu/ColorRect/MarginContainer/VBoxContainer/SettingsButton
@onready var quit_button = $CanvasLayer/PauseMenu/ColorRect/MarginContainer/VBoxContainer/QuitButton

func _ready() -> void:
	# Set up canvas layer
	canvas_layer.layer = 100
	
	# Initialize pause menu
	pause_menu.hide()
	pause_menu.mouse_filter = Control.MOUSE_FILTER_STOP
	
	# Connect button signals
	resume_button.pressed.connect(_on_resume_button_pressed)
	settings_button.pressed.connect(_on_settings_button_pressed)
	quit_button.pressed.connect(_on_quit_button_pressed)
	
	# Set up button focus modes
	resume_button.focus_mode = Control.FOCUS_ALL
	settings_button.focus_mode = Control.FOCUS_ALL
	quit_button.focus_mode = Control.FOCUS_ALL

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"): # ESC key
		toggle_pause()

func toggle_pause() -> void:
	is_paused = !is_paused
	get_tree().paused = is_paused
	pause_menu.visible = is_paused
	
	if is_paused:
		resume_button.grab_focus()
	
	emit_signal("pause_state_changed", is_paused)

func _on_resume_button_pressed() -> void:
	toggle_pause()

func _on_settings_button_pressed() -> void:
	print("Settings button pressed!")

func _on_quit_button_pressed() -> void:
	get_tree().quit()
