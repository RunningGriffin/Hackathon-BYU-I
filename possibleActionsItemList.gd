extends Node2D

signal player_action # This one is emitted for every action, so enemies can react
signal player_move
signal player_turn_left
signal player_turn_right

signal activate_moves


func _on_item_activated(index):
	player_action.emit()
		
	match index:
		0: # Move
			player_move.emit()
			
		1: # Turn Left
			player_turn_left.emit()
			
		2: # Turn Right
			player_turn_right.emit()

func _process(_delta):
	pass

func _on_go_button_pressed(actionQueue):
	activate_moves.emit()

