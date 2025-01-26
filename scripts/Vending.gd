extends Area2D

@onready var vending = $CanvasLayer/VendingList
@onready var special_bread_btn = $CanvasLayer/Buy1
@onready var focaccia_bread_btn = $CanvasLayer/Buy2

# Called when the node enters the scene tree for the first time.
func _ready():
	special_bread_btn.pressed.connect(func(): attempt_purchase(6, "special_bread"))
	focaccia_bread_btn.pressed.connect(func(): attempt_purchase(54, "focaccia_bread"))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


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
