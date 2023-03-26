extends Node2D

enum BranchSide {RIGHT, LEFT, NONE}

@export var branch_side: BranchSide
@onready var anim: AnimationPlayer = $Sprite/AnimationPlayer

var should_move = false
var destiny_position = null
var original_position = null

# Called when the node enters the scene tree for the first time.
func _ready():
	branch_side = BranchSide.RIGHT

var t = 0.0

func _physics_process(delta):
	if !should_move:
		return

	t += delta * 5
	position = original_position.lerp(destiny_position, t)
	
	if position.distance_to(destiny_position) < 0.1:
		t = 0.0
		should_move = false

func hit():
	anim.play(Globals.TREE_TUCK_ANIMATIONS_NAMES.HIT)
	

# moving things by animtion, that's a bad idea
func move_down(): 
	anim.play(Globals.TREE_TUCK_ANIMATIONS_NAMES.MOVE)
	
func move_to(final_position):
	destiny_position = final_position
	original_position = get_position()
	should_move = true
#
#func _on_animation_player_animation_finished(anim_name):
#	SignalBus.emit_signal("_on_tree_tuck_animation_finished", anim_name)
