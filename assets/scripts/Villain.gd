extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match get_node("/root/Global").currentCharacter:
		0:
			texture = load("res://assets/Art/Jackrabbit_Joe.png");
		1:
			texture = load("res://assets/Art/Catastrophe_Lainie.png");
		2:
			texture = load("res://assets/Art/Sergio_Valerii.png");
		3:
			texture = load("res://assets/Art/Prospector_Jenkins.png");
		4:
			texture = load("res://assets/Art/Yellowstone_Matt.png");
		5:
			texture = load("res://assets/Art/Sammy_the_Kid.png");
		6:
			texture = load("res://assets/Art/Texas_Red.png");
