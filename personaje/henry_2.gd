
extends CharacterBody2D

const GRAVITY = 900.0
const JUMP_FORCE = -350.0

var alive = true

func _physics_process(delta):
	if not alive:
		return

	velocity.y += GRAVITY * delta

	if Input.is_action_just_pressed("arriba") or Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		velocity.y = JUMP_FORCE

	move_and_slide()

func die():
	alive = false
