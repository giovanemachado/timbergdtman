extends Node2D


func _ready():
	SignalBus.game_over.connect(_on_game_over)
	$GameOverText.hide()
	
func _on_game_over():
	$GameOverText.show()
