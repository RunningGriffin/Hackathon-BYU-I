extends Control


func _on_volume_pressed():
	pass # TODO make the volume meter.


func _on_mode_pressed():
	pass # TODO toggle modes between block and card display


func _on_back_pressed():
	get_tree().change_scene_to_file("res://mainMenu.tscn")
