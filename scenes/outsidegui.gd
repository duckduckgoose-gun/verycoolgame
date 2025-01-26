extends CanvasLayer

@onready var coin_label = $CoinLabel
# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalVars.coin_change.connect(update_label)
	GlobalVars.trash_collected.connect(update_label)
	update_label()



func update_label():
	print("score was changed")
	print("scorechange - "+str(GlobalVars.coins))
	coin_label.text = "Coins: "+str(GlobalVars.coins)+"\nCans: "+str(GlobalVars.inventory["trash"])
