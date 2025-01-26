extends CharacterBody2D

const movement_vectors = [
	Vector2(1, 0), Vector2(-1, 0), Vector2(0, 1), Vector2(0, -1)
]
var vector_index = 0;
@export var speed : float = 20

func _ready():
	vector_index = randi() % 4

func _physics_process(delta):
	var collision = move_and_collide(movement_vectors[vector_index] * speed * delta)
	if collision:
		_body_entered()

func _body_entered():
	# change movement
	var available_indices = []
	for i in range(4):
		if i != vector_index:
			available_indices.append(i)
	vector_index = available_indices[randi() % 3]
