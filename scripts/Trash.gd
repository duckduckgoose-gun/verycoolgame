extends Area2D

# @onready @export

@export var value : int = 3

func _ready():
	pass

func _process(delta):
	pass

func collect(body):
	GlobalVars.add_coins(value)
	self.queue_free()
