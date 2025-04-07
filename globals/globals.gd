extends Node

enum GameMode {
	DIVE_GAME,
	STEALTH_GAME
}

var CURRENT_MODE = GameMode.STEALTH_GAME
var SCORE = 0
var TUTORIALS_COMPLETED = 0
var SPOTS_REMAINING = 6
var BOMBS_CAPTURED = 0
