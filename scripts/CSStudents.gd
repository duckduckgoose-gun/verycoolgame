extends CharacterBody2D

const movement_vectors = [
	Vector2(1, 0), Vector2(-1, 0), Vector2(0, 1), Vector2(0, -1)
]
var vector_index = 0;
@export var speed : float
@export var trash_time : float = 4.5
@export var trash_margin : float = 0.42
@export var chair_probability : float = 0.56

var cur_trash_time = 0
var trash_timer = 0

func _ready():
    cur_trash_time = trash_time + trash_margin * (2 * randfn() - 1)
    vector_index = randi() % 4

func _physics_process(delta):
	var collision = move_and_collide(movement_vectors[vector_index] * speed * delta)
	if collision:
		_body_entered()

func create_trash():
    cur_trash_time = trash_time + trash_margin * (2 * randfn() - 1)
    # spawn trash lmao
    

func _body_entered():
	# change movement
	var available_indices = []
	for i in range(4):
		if i != vector_index:
			available_indices.append(i)
	vector_index = available_indices[randi() % 3]
