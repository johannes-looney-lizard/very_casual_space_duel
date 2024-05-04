extends CharacterBody2D

@onready var sprite_2d: Sprite2D = $Sprite2D

@export var player_number : int = 1

const SPEED = 600.0

func _ready() -> void:
	var selection : StartRound.Selection = StartRound.Selection.NONE
	match player_number:
		1: selection = GameManager.player1_selection
		2: selection = GameManager.player2_selection
	match selection:
		StartRound.Selection.ROCK:
			sprite_2d.texture = load(str("res://assets/Hands/", player_number, "R.png"))
		StartRound.Selection.PAPER:
			sprite_2d.texture = load(str("res://assets/Hands/", player_number, "P.png"))
		StartRound.Selection.SCISSORS:
			sprite_2d.texture = load(str("res://assets/Hands/", player_number, "S.png"))

func _physics_process(delta: float) -> void:
	
	if Input.is_action_just_pressed(str("player_", player_number, "_shoot")):
		print(str("Player ", player_number, " shot!"))
	
	var direction := Input.get_axis(str("player_", player_number, "_up"), str("player_", player_number, "_down"))
	if direction:
		velocity.y = direction * SPEED
	else:
		velocity.y = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
