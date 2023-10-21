extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	$Control.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $CharacterBody2D.position.x > 500:
		$Control.show()
