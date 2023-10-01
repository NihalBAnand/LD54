extends Node2D


# Called when the node enters the scene tree for the first time.
var ammo = 7
var nodes: Array;

func _ready():
	nodes = get_children()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func updateAmmo(reload):
	if reload:
		ammo = 8
	else:
		ammo-=1
	for n in range(0, nodes.size()):
		if n <= ammo:
			nodes[n].visible = true
		else:
			nodes[n].visible = false 
