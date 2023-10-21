extends Area2D

class_name coin

@onready var player = $"../Player"

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("animated")

func _process(delta):
	if player.position == position:
		player.getCoin()
		queue_free()
