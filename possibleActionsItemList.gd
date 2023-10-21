extends ItemList


var action_move_toggle = false
var action_turn_left_toggle = false
var action_turn_right_toggle = false


func _on_item_activated(index):
	match index:
		0: # Move
			print("Move")
			
			
		1: # Turn Left
			print("Turn Left")
			
			
		2: # Turn Right
			print("Turn Right")
			

