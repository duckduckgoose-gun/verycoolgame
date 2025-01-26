extends Node2D

signal coin_change
signal robbery

var coins: int = 0

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
