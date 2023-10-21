extends Area2D

const SPEED = 400
const RADIANS = PI /2
var screen_size: Vector2
var coins: int
var alive = true
signal win
signal enemy_move
signal shareActionQueue

var turns = 0
var actionQueue = []

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
	

func _physics_process(delta):
	position = position.clamp(Vector2.ZERO, screen_size)


func _process(delta):
	pass




func player_move():
	turns += 1
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


func getArnold():
	win.emit()


func _on_player_move():
	actionQueue.append("move")
	shareActionQueue.emit(actionQueue, true)
	

func _on_player_turn_left():
	actionQueue.append("turn left")
	shareActionQueue.emit(actionQueue, true)


func _on_player_turn_right():
	actionQueue.append("turn right")
	shareActionQueue.emit(actionQueue, true)
		
		
func _on_activate_moves():
	while len(actionQueue) != 0 and alive == true:
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
				
		shareActionQueue.emit(actionQueue, false)
		await get_tree().create_timer(0.5).timeout
		
	print("All actions done \n\n")
	
	


func _on_move_delay_timer_timeout():
	pass



func _on_enemy_hit():
	print("player received kill signal")
	alive = false
	


func _on_enemy_2_hit():
	print("player received kill signal")
	alive = false
	


func _on_actions_interface_remove_action(index):
	actionQueue.remove_at(index)
