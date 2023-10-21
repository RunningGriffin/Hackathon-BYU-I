extends Area2D

signal hit

var enemy_move_toggle = false
var enemy_turn_left_toggle = false
var enemy_turn_right_toggle = false

var direction = 1

var random = RandomNumberGenerator.new()

var screen_size

var list : Array = [2,2,3,2,2,1,2,1,2,2,2,2,1,2,1,2,3,2,2,1,2,1,2,2,3,2,2,1,2,1,2,2,2,2,1,2,1,2,3,2,2,1,2,1,2,2,3,2,2,1,2,1,2,2,2,2,1,2,1,2,3,2,2,1,2,1]

@onready var player = $"../Player"

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	
	position = position.clamp(Vector2.ZERO, screen_size)
	
	handle_collision()
	
	enemy_move_toggle = false
	enemy_turn_left_toggle = false
	enemy_turn_right_toggle = false
		
func handle_move():
	random.randomize()
	var choice = random.randi_range(1, 4)
	
	if choice % 2 == 0:
		enemy_move_toggle = true
	elif choice == 1:
		enemy_turn_left_toggle = true
	elif choice == 3:
		enemy_turn_right_toggle = true
	
func handle_collision():
	if position.y + 50 >= player.position.y and position.y - 50 <= player.position.y and position.x + 50 >= player.position.x and position.x - 50 <= player.position.x:
		print('dead')
		queue_free()
		hit.emit()



func _on_player_action():
	handle_move()
	# handle player movement and rotation
	
	if list[0] == 2: 
		if direction == 0:
			$AnimatedSprite2D.animation = 'back'
			position.y -= 100
		elif direction == 1:
			$AnimatedSprite2D.animation = 'left'
			position.x -= 100
		elif direction == 2:
			$AnimatedSprite2D.animation = 'front'
			position.y += 100
		elif direction == 3:
			$AnimatedSprite2D.animation = 'right'
			position.x += 100
	
	#left
	if list[0] == 3:
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
	
	#right
	if list[0] == 1:
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
	
	list.pop_front()
	
	enemy_move_toggle = false
	enemy_turn_left_toggle = false
	enemy_turn_right_toggle = false
