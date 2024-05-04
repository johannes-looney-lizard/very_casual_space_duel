extends Node

var player1_selection : StartRound.Selection
var player2_selection : StartRound.Selection

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Start_Round()

func Start_Round():
	get_tree().change_scene_to_file("res://scenes/start_round.tscn")

func Play_Round(p1 : StartRound.Selection, p2 : StartRound.Selection):
	player1_selection = p1
	player2_selection = p2
	get_tree().change_scene_to_file("res://scenes/game.tscn")
	
