extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	$victoryScreen.hide()
	$GameOverScreen.hide()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_enemy_hit():
	await get_tree().create_timer(1).timeout
	$GameOverScreen.show()


func _on_enemy_2_hit():
	await get_tree().create_timer(1).timeout
	$GameOverScreen.show()

func _on_player_win():
	$victoryScreen.setValues()
	$victoryScreen.show()

