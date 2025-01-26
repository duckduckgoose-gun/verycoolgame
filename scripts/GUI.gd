extends CanvasLayer

@onready var coin_label = $CoinLabel
@onready var steal_label = $StealLabel

func lerp(a, b, t):
	return a + (b - a) * t

func _process(delta):
	steal_label.font_color.a = lerp(steal_label.font_color.a, 0, 0.2)
	steal_label.font_outline_color.a = lerp(steal_label.font_outline_color.a, 0, 0.2)

func on_score_changed():
	print("score was changed")
	print("scorechange - "+str(GlobalVars.coins))
	coin_label.text = "Coins: "+str(GlobalVars.coins)
	#set_text("Coins: ",str(GlobalVars.coins))

func on_robbery():
	print("homeless cs kid sto;e your money lmao")
	steal_label.font_color.a = 1
	steal_label.font_outline_color.a = 1
	
func _ready():
	GlobalVars.coin_change.connect(on_score_changed)

