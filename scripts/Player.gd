extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -400.0
@export var xyz = 3
var anim_direction:Array[String] = ["","_side"]

@onready var animation = $AnimatedSprite2D

func play_animation():
	#direction
	#print("animation: "+str(velocity))
	var animation_name:String
	if velocity.y > 0: #going down
		anim_direction[0] = "_front"
	elif velocity.y < 0:#going up
		anim_direction[0] = "_back"
	elif velocity.y == 0 and velocity.x != 0: #cause if v x is also 0, then its idle
		anim_direction [0] = ""
	if velocity.x != 0:
		anim_direction[1] = "_side"
		if velocity.x < 0: #moving left
			animation.flip_h = true
		elif velocity.x > 0: #moving right
			animation.flip_h = false
	elif velocity.x == 0 and velocity.y != 0:
		anim_direction[1] = ""
	if velocity == Vector2.ZERO:
		animation_name = "idle"+"".join(anim_direction)
	else: #both velocities are 0
		animation_name = "walk"+"".join(anim_direction)
	#print(animation_name)
	animation.play(animation_name)

func _physics_process(_delta):
	var directionx = Input.get_axis("ui_left", "ui_right")
	var directiony = Input.get_axis("ui_up", "ui_down")
	if directionx and directiony:
		velocity.x = directionx * SPEED/sqrt(2)
		velocity.y = directiony * SPEED/sqrt(2)
	elif directionx or directiony:
		velocity.x = directionx * SPEED
		velocity.y = directiony * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
	play_animation()
	move_and_slide()


func buy_2():
	pass # Replace with function body.
