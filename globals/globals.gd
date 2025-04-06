extends Node

enum GameMode {
	DIVE_GAME,
	STEALTH_GAME
}

var CURRENT_MODE = GameMode.STEALTH_GAME
var SCORE = 0
var TUTORIALS_COMPLETED = 0


var dive_missions = [
	"res://scenes/dive_game/dive_missions/dive_mission_1.tscn",
	"res://scenes/dive_game/dive_missions/dive_mission_2.tscn",
	"res://scenes/dive_game/dive_missions/dive_mission_3.tscn",
	"res://scenes/dive_game/dive_missions/dive_mission_4.tscn",
	"res://scenes/dive_game/dive_missions/dive_mission_5.tscn",
	"res://scenes/dive_game/dive_missions/dive_mission_6.tscn"
]