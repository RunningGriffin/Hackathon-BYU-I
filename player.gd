extends Area2D

const SPEED = 400
const RADIANS = PI /2
var screen_size: Vector2
var coins: int
signal win
signal enemy_move

var action_move_toggle = false
var action_turn_left_toggle = false
var action_turn_right_toggle = false

var actionQueue = [] # Actions will be added to this before they are used

#used to map rotaion
var direction = 3

func _ready():
	screen_size.x = 1150
	screen_size.y = 650
	$AnimatedSprite2D.play()
	coins = 0
	

func _physics_process(delta):
	position = position.clamp(Vector2.ZERO, screen_size)


func player_move():
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


func player_turn_left():
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


func player_turn_right():
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
	
	
func getCoin():
	coins += 1
	print(coins)
	if coins == 3:
		win.emit()


func _on_player_move():
	actionQueue.append("move")
	

func _on_player_turn_left():
	actionQueue.append("turn left")


func _on_player_turn_right():
	actionQueue.append("turn right")
		
		
func _on_activate_moves():
	while len(actionQueue) != 0:
		enemy_move.emit()
		var current_action = actionQueue.pop_front()
		print(current_action)
		
		match current_action:
			"move": # Move
				player_move()
			
			"turn left": # Turn Left
				player_turn_left()
			
			"turn right": # Turn Right
				player_turn_right()
				
		
		await get_tree().create_timer(0.5).timeout
		
	print("All actions done \n\n")
	
	


func _on_move_delay_timer_timeout():
	pass
