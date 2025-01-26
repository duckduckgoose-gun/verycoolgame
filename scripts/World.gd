extends Node2D


signal coin_change
var coins: int = 0

func add_coins(amount : int):
	coins += amount
	coin_change.emit()
