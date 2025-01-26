extends Node

@onready var world_node = $"."

# Called when the node enters the scene tree for the first time.
func _ready():
	world_node.add_child(load("res://scenes/inside.tscn").instantiate())
	GlobalVars.game_mode_changed.connect(on_game_changed)
		

func on_game_changed(new_state):
	#clearing all children
	for n in world_node.get_children():
		world_node.call_deferred("remove_child",n)
		n.queue_free()
	match GlobalVars.state:
		GlobalVars.States.INSIDE:
			print("inside")
			world_node.call_deferred("add_child",load("res://scenes/inside.tscn").instantiate())
		GlobalVars.States.OUTSIDE:
			print("outside")
			world_node.call_deferred("add_child",load("res://scenes/outside.tscn").instantiate())
