extends Area2D

const SPEED = 400
const RADIANS = PI /2
var screen_size: Vector2

var action_move_toggle = false
var action_turn_left_toggle = false
var action_turn_right_toggle = false

#used to map rotaion
var direction = 3

func _ready():
	screen_size.x = 1150
	screen_size.y = 650
	$AnimatedSprite2D.play()
	

func _physics_process(delta):
	position = position.clamp(Vector2.ZERO, screen_size)


func _on_player_move():
	if direction == 0:
		$AnimatedSprite2D.animation = 'back'
		position.y -= 50
	elif direction == 1:
		$AnimatedSprite2D.animation = 'left'
		position.x -= 50
	elif direction == 2:
		$AnimatedSprite2D.animation = 'front'
		position.y += 50
	elif direction == 3:
		$AnimatedSprite2D.animation = 'right'
		position.x += 50


func _on_player_turn_left():
	if direction == 3:
		direction = 0
	else:
		direction +=1
	if direction == 0:
		$AnimatedSprite2D.animation = 'back'
	elif direction == 1:
		$AnimatedSprite2D.animation = 'left'
	elif direction == 2:
		$AnimatedSprite2D.animation = 'front'
	elif direction == 3:
		$AnimatedSprite2D.animation = 'right'


func _on_player_turn_right():
	if direction == 0:
		direction = 3
	else:
		direction -=1
	if direction == 0:
		$AnimatedSprite2D.animation = 'back'
	elif direction == 1:
		$AnimatedSprite2D.animation = 'left'
	elif direction == 2:
		$AnimatedSprite2D.animation = 'front'
	elif direction == 3:
		$AnimatedSprite2D.animation = 'right'
