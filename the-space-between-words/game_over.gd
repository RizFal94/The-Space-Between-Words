extends CanvasLayer



func _on_coba_lagi_pressed():
	get_tree().change_scene_to_file("res://Scene/DepanKelasTarung.tscn")


func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://Scene/main_menu.tscn")


func _on_keluar_pressed():
	get_tree().quit()
