extends Control


# Button to main menu, will be replaced with button for next level if we get there
func _on_next_level_button_pressed():
	get_tree().change_scene_to_file("res://mainMenu.tscn")
	

# Button for replaying the level
func _on_replay_button_pressed():
	get_tree().change_scene_to_file("res://world.tscn")

# Show the player's score
func print_results():
	pass
