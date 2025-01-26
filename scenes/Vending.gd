extends Area2D

@onready var vending = $CanvasLayer/VendingList
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_body_entered(body):
	if body.name == "Player":
		vending.show()


func _on_body_exited(body):
	if body.name == "Player":
		vending.hide()
