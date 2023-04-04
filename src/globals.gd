extends Node

enum HitSide {RIGHT, LEFT}

enum BranchSide {RIGHT, LEFT, NONE}

const ANIMATION_RESET = 'RESET'

const TREE_TUCK_ANIMATIONS_NAMES = { 
		HIT = 'correct-hit', 
		WRONG_HIT = 'wrong-hit', 
		MOVE = 'move-below',
}

const PLAYER_AXE_ANIM_NAMES = {
	HIT = 'hit'
}

const PLAYER_ANIM_NAMES = {
	IDLE = 'idle'
}
