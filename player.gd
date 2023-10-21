extends CharacterBody2D

const SPEED = 400
const RADIANS = PI /2
var screen_size

#used to map rotaion
var direction = 0


func _ready():
	screen_size = get_viewport_rect().size

func _physics_process(delta):
	
	var velocity = Vector2.ZERO # The player's movement vector.
	
	# handle player movement and rotation
	if Input.is_action_just_pressed("forward"): 
		if direction == 0:
			position.y -= 100
		elif direction == 1:
			position.x -= 100
		elif direction == 2:
			position.y += 100
		elif direction == 3:
			position.x += 100
			
	if Input.is_action_just_pressed("turn_left"):
		rotation -= RADIANS
		if direction == 3:
			direction = 0
		else:
			direction +=1
	if Input.is_action_just_pressed("turn_right"):
		rotation += RADIANS
		if direction == 0:
			direction = 3
		else:
			direction -=1

	if velocity.length() > 0:
		velocity = velocity.normalized() * SPEED
		
		
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
