extends Area2D

# @onready @export

@export var value : int = 3

func _ready():
	pass

func _process(delta):
	pass

func collect(body):
	if body.name == "Player":
		GlobalVars.add_coins(value)
		print(GlobalVars.coins)
		self.queue_free()
