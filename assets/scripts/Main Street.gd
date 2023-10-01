extends Sprite2D

var played = false;
var playedMusic = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (get_parent().sceneState == 2 || get_parent().sceneState == 3 || get_parent().sceneState == 4 || get_parent().sceneState == 5):
		visible = true;
		if (!played):
			get_node("twang").play();
			played = true;
	else:
		visible = false;
	
	if (get_parent().sceneState != 2):
		get_node("twang").stop();
	
	if (get_parent().sceneState == 3 || get_parent().sceneState == 4 || get_parent().sceneState == 5) && (!playedMusic):
		get_node("confrontation").playing = true;
		playedMusic = true;
	if !(get_parent().sceneState == 3 || get_parent().sceneState == 4 || get_parent().sceneState == 5):
		get_node("confrontation").playing = false;
	
	if (get_parent().sceneState == 4 || get_parent().sceneState == 5):
		texture = load("res://assets/Art/High_noon_on_main_street_no_villain.png");
		get_node("Villain").visible = true;
	else:
		texture = load("res://assets/Art/High_noon_on_main_street.png");
		get_node("Villain").visible = false;

