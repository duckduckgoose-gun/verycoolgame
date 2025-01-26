extends Area2D


# # Called when the node enters the scene tree for the first time.
# func _ready():
# 	special_bread_btn.pressed.connect(func(): attempt_purchase(6, "special_bread"))
# 	focaccia_bread_btn.pressed.connect(func(): attempt_purchase(54, "focaccia_bread"))
# 	pass # Replace with function body.
@onready var sold_cans = $CanvasLayer/SoldCanLabel

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready():
	sold_cans.modulate.a = 0

func _on_body_entered(body):
	if body.name == "Player":
		GlobalVars.add_coins(GlobalVars.inventory["trash"] * 3)
		print(GlobalVars.coins)
		sell_cans()
		GlobalVars.inventory["trash"] = 0;

func sell_cans():
	sold_cans.text = "Selling "+str(GlobalVars.inventory["trash"])+" cans!"
	sold_cans.modulate.a = 1
	fade_label2()
	
func fade_label2():
	for i in range(101):
		#print(sold_cans.modulate.a)
		await get_tree().create_timer(.01).timeout
		sold_cans.modulate.a = move_toward(sold_cans.modulate.a, 0, 0.01)

# func _on_body_exited(body):
# 	if body.name == "Player":
# 		vending.hide()
