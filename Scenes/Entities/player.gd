extends CharacterBody2D
class_name Player

const SPEED := 300.0
const JUMP_VELOCITY := -400.0
var score := 0

func _physics_process(_delta: float) -> void:
	var direction := Input.get_vector("left", "right", "up", "down")
	if direction.x: velocity.x = direction.x * SPEED
	else: velocity.x = move_toward(velocity.x, 0, SPEED)
	if direction.y: velocity.y = direction.y * SPEED
	else: velocity.y = move_toward(velocity.y, 0, SPEED)
	move_and_slide()
