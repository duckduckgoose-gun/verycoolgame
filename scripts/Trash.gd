extends Area2D

# @onready @export

var score_tracker : ScoreTracker

@export var value : int = 3

func _ready():
	score_tracker = get_tree()

func _process(delta):
	pass

func collect():
	score_tracker.add_coins(value)
	self.queue_free()
