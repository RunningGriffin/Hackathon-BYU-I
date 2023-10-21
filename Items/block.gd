extends Node2D

# Code blocks that the player picks up while moving around the level.
# When picked up, they should be added to the player's inventory and
# be usable for future turns
class_name block

# Member vars
var x: int
var y: int
var type: String
var quantity: int

# Constructor with paramaters for position, name, type of block (such as movement),
# and number of blocks given upon acquisition
func _init(x, y, name, type, quantity = 1):
	x = x
	y = y
	name = name
	type = type
	quantity = quantity

# Handle acquisition
func getBlock():
	pass
