extends Node

var action_move_toggle = false
var action_turn_left_toggle = false
var action_turn_right_toggle = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$GameOverScreen.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var actions = $TileMap/actionsInterface/possibleActionsItemList
	action_move_toggle = actions.move
	action_turn_left_toggle = actions.action_turn_left_toggle
	action_turn_right_toggle = actions.action_turn_right_toggle


func _on_enemy_hit():
	$GameOverScreen.show()


func _on_enemy_2_hit():
	$GameOverScreen.show()
