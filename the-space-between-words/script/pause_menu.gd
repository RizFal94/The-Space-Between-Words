extends Control

func _ready() -> void:
	# Make sure this menu can process while game is paused
	process_mode = Node.PROCESS_MODE_ALWAYS
	
	# Set up the control to take full screen
	anchor_right = 1
	anchor_bottom = 1
	
	# Set up proper mouse handling
	mouse_filter = Control.MOUSE_FILTER_STOP
	
	# Configure UI elements
	var vbox = $ColorRect/MarginContainer/VBoxContainer
	
	# Set up every child in the VBox (buttons and label)
	for child in vbox.get_children():
		if child is Button:
			# Configure buttons
			child.custom_minimum_size = Vector2(200, 50)
			child.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
			child.mouse_filter = Control.MOUSE_FILTER_STOP
		elif child is Label:
			# Configure label
			child.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
			child.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
			
	# Make sure ColorRect covers the full screen with transparency
	var color_rect = $ColorRect
	color_rect.mouse_filter = Control.MOUSE_FILTER_STOP
	
	# Set up MarginContainer
	var margin = $ColorRect/MarginContainer
	margin.mouse_filter = Control.MOUSE_FILTER_STOP
	
	# Set up VBoxContainer
	vbox.mouse_filter = Control.MOUSE_FILTER_IGNORE
	vbox.alignment = BoxContainer.ALIGNMENT_CENTER
	vbox.add_theme_constant_override("separation", 10)
