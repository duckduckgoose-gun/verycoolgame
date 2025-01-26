extends CanvasLayer

@onready var coin_label = $CoinLabel
@onready var steal_label = $StealLabel

func lerp(a, b, t):
	return a + (b - a) * t

#func _process(delta):

func on_score_changed():
	print("score was changed")
	print("scorechange - "+str(GlobalVars.coins))
	coin_label.text = "Coins: "+str(GlobalVars.coins)
	#set_text("Coins: ",str(GlobalVars.coins))

func on_robbery():
	print("homeless cs kid sto;e your money lmao")
	set("theme_override_colors/font_color", Color(1,1,1,1))
	fade_label()

func fade_label():
	steal_label.set_modulate(lerp(steal_label.modulate, Color(1,1,1,0), 0.2))

func _ready():
	GlobalVars.coin_change.connect(on_score_changed)
	GlobalVars.robbery.connect(on_robbery)

