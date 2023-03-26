extends Node2D

signal hit(side)

func _process(_delta):
	if Input.is_action_pressed("cut_right"):
		hit_tree(Globals.HitSide.RIGHT)

	if Input.is_action_pressed("cut_left"):
		hit_tree(Globals.HitSide.LEFT)


func hit_tree(side):
	hit.emit(side)
