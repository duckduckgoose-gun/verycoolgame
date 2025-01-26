extends Area2D

# @onready @export

const textures = [
	preload("res://textures/trash/cola.png"),
	preload("res://textures/trash/pepsi.png"),
	preload("res://textures/trash/sprite.png"),
	preload("res://textures/trash/welchs.png"),
	preload("res://textures/trash/welchs.png")
]
var value : int = 3
var time_elapsed : float = 0

func _ready():
	$Sprite2D.texture = textures[randi() % textures.size()]

func _process(delta):
	time_elapsed += delta
	$Sprite2D.position.y = round((sin(time_elapsed * 15) + 1) / 2) * 0.5

func collect(body):
	if body.name == "Player":
		GlobalVars.add_coins(value)
		print(GlobalVars.coins)
		self.queue_free()
