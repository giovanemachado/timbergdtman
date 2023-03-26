extends Node2D

enum branchSide {RIGHT, LEFT, NONE}

@export var BranchSide: branchSide
@onready var anim: AnimationPlayer = $Sprite/AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	BranchSide = branchSide.RIGHT

func Hitted():
	anim.play("correct-hit")
	
# moving things by animtion, that's a bad idea
func MoveDown(): 
	anim.play("move-below")

func _on_animation_player_animation_finished(anim_name):
	SignalBus.emit_signal("_on_tree_tuck_animation_finished", anim_name)
