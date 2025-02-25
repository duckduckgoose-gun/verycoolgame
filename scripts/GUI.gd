extends CanvasLayer

@onready var coin_label = $CoinLabel
@onready var steal_label = $StealLabel

func lerp(a, b, t):
	return a + (b - a) * t

#func _process(delta):

func update_label():
	print("score was changed")
	print("scorechange - "+str(GlobalVars.coins))
	coin_label.text = "Coins: "+str(GlobalVars.coins)+"\nCans: "+str(GlobalVars.inventory["trash"])
	#set_text("Coins: ",str(GlobalVars.coins))

func on_robbery():
	print("homeless cs kid sto;e your money lmao")
	steal_label.modulate.a = 1
	fade_label()

func fade_label():
	for i in range(101):
		print(steal_label.modulate.a)
		await get_tree().create_timer(.01).timeout
		steal_label.modulate.a = move_toward(steal_label.modulate.a, 0, 0.01)

func _ready():
	GlobalVars.coin_change.connect(update_label)
	GlobalVars.trash_collected.connect(update_label)
	update_label()
	GlobalVars.robbery.connect(on_robbery)
	steal_label.modulate.a = 0
