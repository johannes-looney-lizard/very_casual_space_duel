class_name Player
extends CharacterBody2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var bullet_spawn_1: Marker2D = $BulletSpawn1
@onready var bullet_spawn_2: Marker2D = $BulletSpawn2

@export var player_number : int = 1

var selection : StartRound.Selection

const SPEED = 600.0

func _ready() -> void:
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
		var bullet_spawn := bullet_spawn_1
		if (player_number == 2):
			bullet_spawn = bullet_spawn_2
		var bullet : Bullet = Bullet.new_bullet(self, selection, bullet_spawn.global_transform, 800.0)
		owner.add_child(bullet)
	
	var direction := Input.get_axis(str("player_", player_number, "_up"), str("player_", player_number, "_down"))
	if direction:
		velocity.y = direction * SPEED
	else:
		velocity.y = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
