extends Sprite2D

var done = false;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (get_parent().visible):
		rotate(-.05);
		translate(Vector2(-3, 0));
		if (global_position.x <= -300 && !done && get_parent().get_parent().sceneState == 2):
			get_parent().get_parent().sceneState += 1;
			done = true
