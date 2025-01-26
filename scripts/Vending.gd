extends Area2D

@onready var vending = $CanvasLayer/Control
@onready var sold_label = $CanvasLayer/SoldLabel
@onready var win_screen_ = $CanvasLayer/WinScreen

# Called when the node enters the scene tree for the first time.
func _ready():
	sold_label.modulate.a = 0
	GlobalVars.sold.connect(on_sold)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func buy_1():
	attempt_purchase(6, "special_bread")

func buy_2():
	attempt_purchase(54, "focaccia_bread")

func attempt_purchase(price, item):
	if GlobalVars.coins < price:
		return false
	GlobalVars.add_coins(-price)
	GlobalVars.inventory[item] += 1
	return true

func on_sold():
	sold_label.modulate.a = 1
	fade_label2()
	
func fade_label2():
	for i in range(101):
		print(sold_label.modulate.a)
		await get_tree().create_timer(.01).timeout
		sold_label.modulate.a = move_toward(sold_label.modulate.a, 0, 0.01)

func _on_body_entered(body):
	if body.name == "Player":
		vending.show()


func _on_body_exited(body):
	if body.name == "Player":
		vending.hide()
