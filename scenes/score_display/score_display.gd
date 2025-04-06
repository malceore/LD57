extends Node2D


var score = 0

func _process(delta):
    if Globals.SCORE != score:
        score = Globals.SCORE
        $Label.text = "[center]Score: " + str(score)