extends Sprite2D

var played = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (get_parent().sceneState == 6):
		visible = true;
		if !played:
			played = true;
			get_node("AudioStreamPlayer").play();
	else:
		visible = false;
