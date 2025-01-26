extends StaticBody2D

const forward_directions = [
    Vector2(0, 1), Vector2(1, 0), Vector2(0, -1), Vector2(-1, 0)
]
@export var direction : int = 2

var pulled_out : bool = false

func pull_out():
    if !pulled_out:
        position -= forward_directions

func push_in():
    if pulled_out:
        position += forward_directions