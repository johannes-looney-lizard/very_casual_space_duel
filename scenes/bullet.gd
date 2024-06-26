class_name Bullet
extends Area2D

enum BulletType { NONE = 0, ROCK = 1, PAPER = 2, SCISSORS = 3 }

@onready var sprite_2d: Sprite2D = $Sprite2D

var speed := 800.0
var shooter : Player

static func new_bullet(shooter : Player, selection : StartRound.Selection, transform : Transform2D, speed : float) -> Bullet:
	var scene : PackedScene = load("res://scenes/bullet.tscn")
	var bullet : Bullet = scene.instantiate()
	bullet.shooter = shooter
	bullet.transform = transform
	bullet.speed = speed
	return bullet

func _ready() -> void:
	match shooter.selection:
		StartRound.Selection.ROCK:
			sprite_2d.texture = load(str("res://assets/Projectiles/P", shooter.player_number, "/R.png"))
		StartRound.Selection.PAPER:
			sprite_2d.texture = load(str("res://assets/Projectiles/P", shooter.player_number, "/P.png"))
		StartRound.Selection.SCISSORS:
			sprite_2d.texture = load(str("res://assets/Projectiles/P", shooter.player_number, "/S.png"))

func _physics_process(delta: float) -> void:
	position += transform.x * speed * delta


func _on_body_entered(body: Node2D) -> void:
	if body != shooter:
		queue_free()
