extends ItemList


var move = false
var action_turn_left_toggle = false
var action_turn_right_toggle = false


func _on_item_activated(index):
	match index:
		0: # Move
			move = true
			
			
		1: # Turn Left
			action_turn_left_toggle = true
			
			
		2: # Turn Right
			action_turn_right_toggle = true

func _process(_delta):
	move = false
	action_turn_left_toggle = false
	action_turn_right_toggle = false

