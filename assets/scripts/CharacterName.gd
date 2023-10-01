extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (get_parent().get_parent().get_parent().sceneState == 5):
		text = get_node("/root/Global").characterNames[get_node("/root/Global").currentCharacter];
	else:
		text = "STRANGER";
