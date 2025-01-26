extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -400.0
@export var xyz = 3

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var directionx = Input.get_axis("ui_left", "ui_right")
	var directiony = Input.get_axis("ui_up", "ui_down")
	if directionx and directiony:
		velocity.x = directionx * SPEED/sqrt(2)
		velocity.y = directiony * SPEED/sqrt(2)
	elif directionx or directiony:
		velocity.x = directionx * SPEED
		velocity.y = directiony * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
