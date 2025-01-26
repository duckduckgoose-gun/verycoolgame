extends Node2D

signal coin_change
signal robbery
signal win

var inventory: Dictionary = {
	"metal_cans": 0,
	"wrappers": 0,
	"sandvich": 0,
	"special_bread": 0, # coin multiplier or smthj lmao
	"focaccia_bread": 0
}
var coins: int = 0
var previously_won = false

func _process(delta):
	if inventory["focaccia_bread"] > 0 and not previously_won:
		win.emit()
		previously_won = true

func add_trash(type : String):
	inventory[type] += 1

enum States {INSIDE,OUTSIDE}
signal game_mode_changed(new_state)
var state:int = States["INSIDE"]:
	set (value):
		state = value
		game_mode_changed.emit(value)

func add_coins(amount : int, steal : bool = false):
	coins += amount
	coin_change.emit()
	if steal:
		robbery.emit()
