extends Control


@onready var player = $"../TileMap/Player"


# Button to main menu, will be replaced with button for next level if we get there
func _on_next_level_button_pressed():
	get_tree().change_scene_to_file("res://mainMenu.tscn")
	

# Button for replaying the level
func _on_replay_button_pressed():
	get_tree().change_scene_to_file("res://world.tscn")


# Set the values for turns and score
func setValues():
	var score = "Score: %s"
	var turns = "Turns: %s"
	$Panel/Score.text = score % str(player.coins)
	$Panel/Turns.text = turns % str(player.turns)

# Show the player's score
func print_results():
	pass

