extends CharacterBody2D

const movement_vectors : Array[Vector2] = [
	Vector2(1, 0), Vector2(-1, 0), Vector2(0, 1), Vector2(0, -1)
]
# const trash_names : Array[String] = [
# 	"cola", "sprite", "pepsi",
# 	"welchs", "welchs"
# ]

var vector_index = 0;
@export var speed : float = 40
@export var steal_cooldown : float = .25
@export var trash_time : float = 4.5
@export var trash_margin : float = 0.42
@export var chair_probability : float = 0.56

var cur_trash_time = 0
var trash_timer = 0
var steal_timer = 1234567890

const trash = preload("res://scenes/trash.tscn")
@onready var all_trash = $"../../../TrashInst"
func _ready():
	cur_trash_time = trash_time + trash_margin * (2 * randf() - 1)
	vector_index = randi() % 4

func _physics_process(delta):
	#
	steal_timer += delta
	
	move_and_collide(movement_vectors[vector_index] * delta * speed)
	
	if trash_timer >= cur_trash_time:
		create_trash()
	else:
		trash_timer += delta
	

func create_trash():
	cur_trash_time = trash_time + trash_margin * (2 * randf() - 1)
	trash_timer = 0
	# spawn trash lmao
	#var trash_name = trash_names[randi() % trash_names.size()];
	#var new_trash = get_tree().call_deferred("add_child", load("res://scenes/trash.tscn").instantiate())
	var new_trash = trash.instantiate()
	all_trash.add_child(new_trash)
	new_trash.position = position
	

func _body_entered(body):
	# change movement
	var available_indices = []
	for i in range(4):
		if i != vector_index:
			available_indices.append(i)
	vector_index = available_indices[randi() % 3]
	
	if body.name == "Chair": body.pull_out()
	elif body.name == "Player" and steal_timer>steal_cooldown:
		print("stealing")
		if GlobalVars.coins > 0:
			GlobalVars.add_coins(-2 - randi() % 3, true)
			steal_timer = 0
		var vector_copy = vector_index
		while vector_copy == vector_index:
			vector_index = randi() % 4
			print(vector_index,vector_copy)
