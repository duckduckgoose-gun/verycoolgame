extends Area2D

signal shop_visibility_lmao(peepeepoopoo : bool)

# @onready @export

func _process(delta):
	# time_elapsed += delta
	# $Sprite2D.position.y = round((sin(time_elapsed * 15) + 1) / 2) * 0.5

func toggle_shop(body):
	if body.name == "Player":
        shop_visibility_lmao.emit(true) 
		pass
