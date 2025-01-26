extends Node2D

signal coin_change
signal robbery

var coins: int = 0

func add_coins(amount : int, steal : bool = false):
	coins += amount
	coin_change.emit()
	if steal:
		robbery.emit()
