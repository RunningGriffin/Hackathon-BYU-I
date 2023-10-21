extends CharacterBody2D

const SPEED = 400
const RADIANS = PI /2
var screen_size

var action_move_toggle = false
var action_turn_left_toggle = false
var action_turn_right_toggle = false

#used to map rotaion
var direction = 0


func _ready():
	screen_size = get_viewport_rect().size

func _physics_process(delta):
	
	var velocity = Vector2.ZERO # The player's movement vector.
	
	action_move_toggle = get_parent().action_move_toggle
	action_turn_left_toggle = get_parent().action_turn_left_toggle
	action_turn_right_toggle = get_parent().action_turn_right_toggle

	# handle player movement and rotation
	if action_move_toggle: 
		if direction == 0:
			position.y -= 100
		elif direction == 1:
			position.x -= 100
		elif direction == 2:
			position.y += 100
		elif direction == 3:
			position.x += 100
			
	if action_turn_left_toggle:
		rotation -= RADIANS
		if direction == 3:
			direction = 0
		else:
			direction +=1
	if action_turn_right_toggle:
		rotation += RADIANS
		if direction == 0:
			direction = 3
		else:
			direction -=1		
		
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
