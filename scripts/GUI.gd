extends CanvasLayer

@onready var coin_label = $CoinLabel
@onready var steal_label = $StealLabel
@onready var sold_label = $SoldLabel
@onready var win_screen_ = $WinScreen

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
	steal_label.modulate.a = 1
	fade_label()

func on_sold():
	sold_label.modulate.a = 1
	fade_label2()

func fade_label():
	for i in range(101):
		print(steal_label.modulate.a)
		await get_tree().create_timer(.01).timeout
		steal_label.modulate.a = move_toward(steal_label.modulate.a, 0, 0.01)

func fade_label2():
	for i in range(101):
		print(sold_label.modulate.a)
		await get_tree().create_timer(.01).timeout
		sold_label.modulate.a = move_toward(sold_label.modulate.a, 0, 0.01)

func _ready():
	GlobalVars.coin_change.connect(on_score_changed)
	GlobalVars.robbery.connect(on_robbery)
	GlobalVars.sold.connect(on_sold)
	steal_label.modulate.a = 0
	sold_label.modulate.a = 0
