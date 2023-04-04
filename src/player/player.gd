extends Node2D

signal hit(side)

@onready var player_sprite = $PlayerSprite
@onready var axe_sprite = $PlayerSprite/AxeSprite
@onready var right_position = $PlayerRightPosition.position
@onready var left_position = $PlayerLeftPosition.position

@onready var axeAnim = $PlayerSprite/AxeAnimationPlayer
@onready var anim = $AnimationPlayer

@onready var CURRENT_SCALE = player_sprite.scale.x

var game_over = false

func _ready():
	SignalBus.game_over.connect(_on_game_over)
	anim.play(Globals.PLAYER_ANIM_NAMES.IDLE)

func _process(_delta):
	if game_over && Input.is_action_pressed("restart"):
		get_tree().reload_current_scene()
		return
		
	if game_over:
		anim.play(Globals.ANIMATION_RESET)
		return
		
	if Input.is_action_pressed("cut_right"):
		player_sprite.scale.x = -CURRENT_SCALE
		axeAnim.play(Globals.PLAYER_AXE_ANIM_NAMES.HIT)
		axeAnim.queue(Globals.ANIMATION_RESET)
		hit_tree(Globals.HitSide.RIGHT)

	if Input.is_action_pressed("cut_left"):
		player_sprite.scale.x = CURRENT_SCALE
		axeAnim.play(Globals.PLAYER_AXE_ANIM_NAMES.HIT)
		axeAnim.queue(Globals.ANIMATION_RESET)
		hit_tree(Globals.HitSide.LEFT)

func _on_game_over():
	game_over = true
	
func hit_tree(side):
	if side == Globals.HitSide.RIGHT:
		player_sprite.position = right_position
		
	if side == Globals.HitSide.LEFT:
		player_sprite.position = left_position

	hit.emit(side)
