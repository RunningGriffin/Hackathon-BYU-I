extends ItemList


func _on_item_activated(index):
	match index:
		0: # Move
			print("Move")
		1: # Turn
			print("Turn")
