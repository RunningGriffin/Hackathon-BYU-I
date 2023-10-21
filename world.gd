extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	$GameOverScreen.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_enemy_hit():
	$GameOverScreen.show()


func _on_enemy_2_hit():
	$GameOverScreen.show()
