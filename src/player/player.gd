extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("cut_right"):
		print("cut right pressed");
	if Input.is_action_pressed("cut_left"):
		print("cut left pressed")

	# if velocity.length() > 0:
	#     velocity = velocity.normalized() * speed
	#     $AnimatedSprite2D.play()
	# else:
	#     $AnimatedSprite2D.stop()
