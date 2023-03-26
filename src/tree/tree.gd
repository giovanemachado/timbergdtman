extends Node2D

@export var tree_tuck: PackedScene

@export var tucks_support: Array[NodePath]
@onready var tucks = tucks_support.map(get_node) 

var can_hit: bool = true
@onready var tree_spawn = $TreePosition.position
@onready var final_position = $TreePositionFinal.position 
@onready var timer = $Timer

const HIT_COOLDOWN = 0.2

func _ready():
	timer.wait_time = HIT_COOLDOWN
	SignalBus.game_over.connect(_on_game_over)

func _on_player_hit(side):
	if !can_hit:
		return
		
	can_hit = false
	
	timer.start()
	
	tucks[0].hit()
	tucks.remove_at(0)
	
	if check_branch_side(tucks[0], side):
		SignalBus.emit_signal("game_over")
		return
		
	update_all_tucks()
	SignalBus.tree_hit.emit()

func _on_game_over():
	print("yeh")
	timer.stop()
	can_hit = false

func _on_timer_timeout():
	can_hit = true
	
func update_all_tucks():
	var i = 0
	for tuck in tucks:
		if i == 0:
			tuck.move_to(final_position)
			i += 1
			continue
			
		tuck.move_to(tucks[i-1].position)
		i += 1
	
	var new_tree_tuck = tree_tuck.instantiate()
	add_child(new_tree_tuck)
	new_tree_tuck.position = tree_spawn
	new_tree_tuck.update_branch_side(Globals.BranchSide.values()[randi() % Globals.BranchSide.size()])
	tucks.append(new_tree_tuck)

func check_branch_side(tuck, side):
	var branch_side = tuck.get("branch_side")
	return branch_side == side
