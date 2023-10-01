extends Node2D

var health = 2
# Called when the node enters the scene tree for the first time.
var hearts: Array;

func _ready():
	hearts = get_children()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func updateHealth():
	for h in range(0,  hearts.size()):
		if h <= health:
			hearts[h].visible = true
		else:
			hearts[h].visible = false  
