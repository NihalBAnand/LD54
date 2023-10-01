extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (get_parent().sceneState == 2 || get_parent().sceneState == 3 || get_parent().sceneState == 4 || get_parent().sceneState == 5):
		visible = true;
	else:
		visible = false;
	
	if (get_parent().sceneState == 4 || get_parent().sceneState == 5):
		texture = load("res://assets/Art/High_noon_on_main_street_no_villain.png");
		get_node("Villain").visible = true;
	else:
		texture = load("res://assets/Art/High_noon_on_main_street.png");
		get_node("Villain").visible = false;

