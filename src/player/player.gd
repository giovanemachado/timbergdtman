extends Node2D

signal hit(side)

@onready var right_position = $PlayerRightPosition.position
@onready var left_position = $PlayerLeftPosition.position

var game_over = false

func _ready():
	SignalBus.game_over.connect(_on_game_over)

func _process(_delta):
	if game_over && Input.is_action_pressed("restart"):
		get_tree().reload_current_scene()
		return

	if Input.is_action_pressed("cut_right"):
		hit_tree(Globals.HitSide.RIGHT)

	if Input.is_action_pressed("cut_left"):
		hit_tree(Globals.HitSide.LEFT)

func _on_game_over():
	game_over = true
	
func hit_tree(side):
	if side == Globals.HitSide.RIGHT:
		$TempPlayer.position = right_position
		
	if side == Globals.HitSide.LEFT:
		$TempPlayer.position = left_position

	hit.emit(side)
