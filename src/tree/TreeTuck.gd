extends Node2D

signal _on_animation_player_animation_finished_tree_tuck(anim_name)
enum branchSide {RIGHT, LEFT, NONE}

@export var BranchSide: branchSide
@onready var anim: AnimationPlayer = $Sprite/AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	BranchSide = branchSide.RIGHT
	pass # Replace with function body.

func Hitted():
	print("Correct hit. Play anim, then remove")
	anim.play("correct-hit")
	print(anim.is_playing())
	
# moving things by animtion, that's a bad idea
func MoveDown(): 
#	anim.play("move-below")
	pass


func _on_animation_player_animation_finished(anim_name):
	_on_animation_player_animation_finished_tree_tuck.emit(anim_name)
