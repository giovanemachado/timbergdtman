extends Node2D

# Tree hits
signal hit(cuttingAt)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("cut_right"):
		hitTheTree(cutSide.CUT_RIGHT)
	if Input.is_action_pressed("cut_left"):
		hitTheTree(cutSide.CUT_LEFT)

# Possible sides to cut the tree down
enum cutSide {CUT_RIGHT, CUT_LEFT}

func hitTheTree(cuttingAt):
	hit.emit(cuttingAt)
