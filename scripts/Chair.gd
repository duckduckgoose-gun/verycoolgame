extends StaticBody2D
class_name Chair

const forward_directions : Array[Vector2] = [
	Vector2(0, 1), Vector2(1, 0), Vector2(0, -1), Vector2(-1, 0)
]
@export var direction : int = 2

var pulled_out : bool = false

func pull_out():
	if !pulled_out:
		position -= forward_directions[direction]

func push_in():
	if pulled_out:
		position += forward_directions[direction]
