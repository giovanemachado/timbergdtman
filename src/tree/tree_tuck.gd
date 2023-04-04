extends Node2D

@export var branch_side: Globals.BranchSide
@onready var anim: AnimationPlayer = $Sprite/AnimationPlayer

@onready var right_branch_position = $RightBranchPosition.position
@onready var left_branch_position = $LeftBranchPosition.position
@onready var branch = $Branch

var should_move = false
var destiny_position = null
var original_position = null

var timing_to_move = 0.0
var movement_speed = 5
var distance_to_stop_move = 0.1

# Called when the node enters the scene tree for the first time.
func _ready():
	update_branch_side(branch_side)

func _physics_process(delta):
	if !should_move:
		return

	timing_to_move += delta * movement_speed
	position = original_position.lerp(destiny_position, timing_to_move)
	
	if position.distance_to(destiny_position) < distance_to_stop_move:
		timing_to_move = 0.0
		should_move = false

func hit():
	z_index = 1
	
	if branch != null:
		branch.queue_free()
		
	anim.play(Globals.TREE_TUCK_ANIMATIONS_NAMES.HIT)
	
func move_to(final_position):
	destiny_position = final_position
	original_position = get_position()
	should_move = true
#
func _on_animation_player_animation_finished(anim_name):
	if anim_name!= Globals.TREE_TUCK_ANIMATIONS_NAMES.HIT:
		return
		
	queue_free()
	
func update_branch_side(new_branch_side):
	branch_side = new_branch_side
	if branch_side == Globals.BranchSide.NONE:
		branch.queue_free()
		
	if branch_side == Globals.BranchSide.RIGHT:
		branch.position = right_branch_position
		
	if branch_side == Globals.BranchSide.LEFT:
		branch.set_flip_h(true);
		branch.position = left_branch_position
