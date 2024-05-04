extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Start_Round()

func Start_Round():
	get_tree().change_scene_to_file("res://scenes/start_round.tscn")

func Play_Round(player1_selection : StartRound.Selection, player2_selection : StartRound.Selection):
	print(str("Player1: ", player1_selection, ", Player2: ", player2_selection))
	get_tree().change_scene_to_file("res://scenes/game.tscn")
	
