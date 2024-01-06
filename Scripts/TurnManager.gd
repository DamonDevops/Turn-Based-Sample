extends Node2D

@export var player_char :Node
@export var enemy_char :Node
var current_char :Character

@export var next_turn_delay :float = 1.0
var game_over :bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func begin_next_turn():
	await get_tree().create_timer(0.5).timeout
	if current_char == player_char:
		current_char = enemy_char
	elif current_char == enemy_char:
		current_char = player_char
	else:
		current_char = player_char

func end_current_turn():
	await get_tree().create_timer(next_turn_delay).timeout
	if game_over == false:
		begin_next_turn()

func character_died(character):
	game_over = true
	if character.is_player == true:
		print("Game Over!")
	else:
		print("You Win!")
