extends CharacterBody2D

const SPEED = 130
const ACCELERATION = 5

func _physics_process(delta):
	var input = Vector2.ZERO
	input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	velocity = lerp(velocity, input * SPEED, ACCELERATION * delta)
	move_and_slide()
	if input != Vector2.ZERO:
		$StackedSprite.set_stacked_rotation(velocity.angle() - deg_to_rad(90))
