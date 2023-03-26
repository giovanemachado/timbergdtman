extends Node2D


@export var TreeTuck: PackedScene
@export var TreeSpawn: Node2D

@export var CurrentTucksNps: Array[NodePath]
@onready var CurrentTucks = CurrentTucksNps.map(get_node) 

var canHit: bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalBus._on_tree_tuck_animation_finished.connect(self._on_tree_tuck_animation_finished)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_player_hit(cuttingAt):
	if !canHit:
		return
		
	canHit = false
	
	var hittedTuck = CurrentTucks[1]
	var branchSide = hittedTuck.get("BranchSide")
	
	if branchSide == cuttingAt:
		print("bad")
		return
	
	print("good")
	
	var i = 0
	for tuck in CurrentTucks:
		if i == 0:
			tuck.Hitted()
			i += 1
			continue
		
		tuck.MoveDown()
		i += 1
	
	var newTreeTuck = TreeTuck.instantiate()
	add_child(newTreeTuck)
	newTreeTuck.position = $TreePosition.position
	CurrentTucks.append(newTreeTuck)


func _on_tree_tuck_animation_finished(anim_name):
	if anim_name == 'correct-hit':
		canHit = true
		CurrentTucks[0].queue_free()
		CurrentTucks.remove_at(0)
		
		for tuck in CurrentTucks:
			print(tuck.name)
