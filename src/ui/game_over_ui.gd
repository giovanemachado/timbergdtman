extends Node2D

@onready var game_over_text = $GameOverText


func _ready():
	SignalBus.game_over.connect(_on_game_over)
	hide()
	
func _on_game_over():
	show()
