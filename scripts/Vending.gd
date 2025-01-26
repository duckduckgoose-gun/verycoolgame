extends Area2D

@onready var vending = $CanvasLayer/Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


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
	GlobalVars.coins -= price
	GlobalVars.inventory[item] += 1
	return true

func _on_body_entered(body):
	if body.name == "Player":
		vending.show()


func _on_body_exited(body):
	if body.name == "Player":
		vending.hide()
