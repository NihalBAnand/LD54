extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (get_parent().sceneState == 4 || get_parent().sceneState == 5):
		position = get_node("../Main Street/CameraZoomFocus").global_position;
		zoom = Vector2(3, 3);
	else:
		position = Vector2(1000, 1000);
		zoom = Vector2(1, 1);
