extends CanvasLayer

@onready var coin_label = $CoinLabel

func on_score_changed():
	print("score was changed")
	print("scorechange - "+str(GlobalVars.coins))
	coin_label.text = "Coins: "+str(GlobalVars.coins)
	#set_text("Coins: ",str(GlobalVars.coins))
	
func _ready():
	GlobalVars.coin_change.connect(on_score_changed)

