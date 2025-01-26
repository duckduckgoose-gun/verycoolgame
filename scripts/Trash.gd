extends Area2D

# @onready @export

var score_tracker : ScoreTracker

@export var value : int = 3

func _ready():
	for child in get_tree().get_children():
		if child is ScoreTracker:
			score_tracker = child

func _process(delta):
	pass

func collect():
	score_tracker.add_coins(value)
	self.queue_free()
