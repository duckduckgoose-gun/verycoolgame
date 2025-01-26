extends StaticBody2D

# @onready @export

var score_tracker : ScoreTracker

@export var value : int = 3

func _ready():
    connect("body_entered", self, "collect")
    for child in get_tree():
        if child is ScoreTracker:
            score_tracker = child

func _process(delta):
    pass

func collect():
    score_tracker.add_coins(value)
    self.queue_free()