extends Area2D

@onready var player = $"../Player"

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("default")

func _process(delta):
	if player.position == position:
		player.getArnold()
		queue_free()
