extends CharacterBody2D

const movement_vectors = [
	Vector2(1, 0), Vector2(-1, 0), Vector2(0, 1), Vector2(0, -1)
]
const trash_names = [
    "cola", "sprite", "pepsi",
    "welchs", "welchs"
]

var vector_index = 0;
@export var speed : float
@export var steal_cooldown : float = 1
@export var trash_time : float = 4.5
@export var trash_margin : float = 0.42
@export var chair_probability : float = 0.56

var cur_trash_time = 0
var trash_timer = 0
var steal_timer = 0

func _ready():
    cur_trash_time = trash_time + trash_margin * (2 * randfn() - 1)
    vector_index = randi() % 4

func _physics_process(delta):
	var collision = move_and_collide(movement_vectors[vector_index] * speed * delta)
    steal_cooldown += delta
	if collision:
		_body_entered()

        const collider = collision.get_collider()
        if collider is Chair: collider.pull_out()
        if collider.name == "Player" and steal_timer >= steal_cooldown:
            GlobalVars.add_coins(-3)
            steal_timer = 0

    if trash_timer >= cur_trash_time:
        create_trash()
    else:
        trash_timer += delta

func create_trash():
    cur_trash_time = trash_time + trash_margin * (2 * randfn() - 1)
    trash_timer = 0
    # spawn trash lmao
    var trash_name = trash_names[randi() % trash_names.length()];
    var new_trash = get_tree().call_deferred("add_child", load("res://trash/" + trash_name + ".tscn").instantiate())
    new_trash.position = position
    

func _body_entered():
	# change movement
	var available_indices = []
	for i in range(4):
		if i != vector_index:
			available_indices.append(i)
	vector_index = available_indices[randi() % 3]
