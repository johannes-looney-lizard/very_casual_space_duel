extends CharacterBody2D

@export var player_number : int = 1

const SPEED = 600.0

func _physics_process(delta: float) -> void:
	
	if Input.is_action_just_pressed(str("player_", player_number, "_shoot")):
		print(str("Player ", player_number, " shot!"))
	
	var direction := Input.get_axis(str("player_", player_number, "_up"), str("player_", player_number, "_down"))
	if direction:
		velocity.y = direction * SPEED
	else:
		velocity.y = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
