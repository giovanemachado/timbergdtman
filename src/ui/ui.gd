extends Node2D

@onready var score_text = $ScoreText
var score = 0

func _ready():
	SignalBus.tree_hit.connect(_on_tree_hit)

func _on_tree_hit():
	score += 1
	score_text.text = str(score)
	
