extends Node2D

@export var TreeTuck: PackedScene
@export var TreeSpawn: Node2D

@export var CurrentTucks : Array[Node]

# Called when the node enters the scene tree for the first time.
func _ready():
	var treeTuck = TreeTuck.instantiate()
	add_child(treeTuck)
	treeTuck.position = $TreePosition.position
	CurrentTucks.append(treeTuck)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_hit(cuttingAt):
	var treeTuck = TreeTuck.instantiate()
	add_child(treeTuck)
	treeTuck.position = $TreePosition.position
	CurrentTucks.append(treeTuck)
