class_name StartRound
extends CanvasLayer

enum Selection { NONE = 0, ROCK = 1, PAPER = 2, SCISSORS = 3 }

const PLAYER_1_COLOR = "#42a2bc"
const PLAYER_2_COLOR = "#ce6e54"

@onready var player_1_rock: TextureRect = $Player1_Selection/Player1_Rock
@onready var player_1_paper: TextureRect = $Player1_Selection/Player1_Paper
@onready var player_1_scissors: TextureRect = $Player1_Selection/Player1_Scissors

@onready var player_2_rock: TextureRect = $Player2_Selection/Player2_Rock
@onready var player_2_paper: TextureRect = $Player2_Selection/Player2_Paper
@onready var player_2_scissors: TextureRect = $Player2_Selection/Player2_Scissors

@onready var timer: Timer = $Timer
@onready var timerlabel: RichTextLabel = $Timerlabel

var countdown : int = 3
var player1_selection : Selection = Selection.NONE;
var player2_selection : Selection = Selection.NONE;

func _ready() -> void:
	countdown = 3
	timerlabel.text = str(countdown)
	timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:	
	if Input.is_action_pressed("player_1_up"):
		player1_selection = Selection.ROCK
	elif Input.is_action_pressed("player_1_down"):
		player1_selection = Selection.PAPER
	elif Input.is_action_pressed("player_1_shoot"):
		player1_selection = Selection.SCISSORS
		
	if Input.is_action_pressed("player_2_up"):
		player2_selection = Selection.ROCK
	elif Input.is_action_pressed("player_2_down"):
		player2_selection = Selection.PAPER
	elif Input.is_action_pressed("player_2_shoot"):
		player2_selection = Selection.SCISSORS
	
	match player1_selection:
		Selection.NONE:
			player_1_rock.modulate = Color.WHITE
			player_1_paper.modulate = Color.WHITE
			player_1_scissors.modulate = Color.WHITE
		Selection.ROCK:
			player_1_rock.modulate = Color(PLAYER_1_COLOR, 1.0)
			player_1_paper.modulate = Color.WHITE
			player_1_scissors.modulate = Color.WHITE
		Selection.PAPER:
			player_1_rock.modulate = Color.WHITE
			player_1_paper.modulate = Color(PLAYER_1_COLOR, 1.0)
			player_1_scissors.modulate = Color.WHITE
		Selection.SCISSORS:
			player_1_rock.modulate = Color.WHITE
			player_1_paper.modulate = Color.WHITE
			player_1_scissors.modulate = Color(PLAYER_1_COLOR, 1.0)

	match player2_selection:
		Selection.NONE:
			player_2_rock.modulate = Color.WHITE
			player_2_paper.modulate = Color.WHITE
			player_2_scissors.modulate = Color.WHITE
		Selection.ROCK:
			player_2_rock.modulate = Color(PLAYER_2_COLOR, 1.0)
			player_2_paper.modulate = Color.WHITE
			player_2_scissors.modulate = Color.WHITE
		Selection.PAPER:
			player_2_rock.modulate = Color.WHITE
			player_2_paper.modulate = Color(PLAYER_2_COLOR, 1.0)
			player_2_scissors.modulate = Color.WHITE
		Selection.SCISSORS:
			player_2_rock.modulate = Color.WHITE
			player_2_paper.modulate = Color.WHITE
			player_2_scissors.modulate = Color(PLAYER_2_COLOR, 1.0)


func _on_timer_timeout() -> void:
	countdown -= 1
	if (countdown > 0):
		timerlabel.text = str(countdown)
		timer.start()
	elif (countdown == 0):
		timerlabel.text = "GO"
		timer.start()
	else:
		if player1_selection == Selection.NONE:
			player1_selection = Selection.ROCK
		if player2_selection == Selection.NONE:
			player2_selection = Selection.ROCK
		GameManager.Play_Round(player1_selection, player2_selection)
