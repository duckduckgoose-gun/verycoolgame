extends Area2D

@export var DO_NOT_CHANGE = GlobalVars.States
@export var destination:int

func _on_area_2d_body_entered(body):
	#print(body.name)
	if body.name == "Player":
		GlobalVars.state = destination
