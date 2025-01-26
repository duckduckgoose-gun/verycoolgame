extends Control

@onready var score_label = $ScoreLabel

func _ready():
	

func on_score_changed():
	$Label.text = "Coins: "+str(GlobalVars.score)
