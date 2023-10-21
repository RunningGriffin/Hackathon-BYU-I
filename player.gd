extends Area2D

const SPEED = 400
const RADIANS = PI /2
var screen_size: Vector2
var coins: int

var action_move_toggle = false
var action_turn_left_toggle = false
var action_turn_right_toggle = false

#used to map rotaion
var direction = 3

func _ready():
	screen_size.x = 1150
	screen_size.y = 650
	$AnimatedSprite2D.play()
	coins = 0
	name = "player"
	

func _physics_process(delta):
	
	var velocity = Vector2.ZERO # The player's movement vector.
	
	action_move_toggle = get_owner().action_move_toggle
	action_turn_left_toggle = get_owner().action_turn_left_toggle
	action_turn_right_toggle = get_owner().action_turn_right_toggle

	# handle player movement and rotation
	if action_move_toggle: 
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
			
	if action_turn_left_toggle:
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
			
	if action_turn_right_toggle:
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
		
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)

func getCoin():
	coins += 1
