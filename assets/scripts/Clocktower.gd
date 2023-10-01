extends Sprite2D

var played = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (get_parent().sceneState == 1):
		visible = true;
		if (!played):
			get_node("AudioStreamPlayer").play();
			played = true;
	else:
		visible = false;
		get_node("AudioStreamPlayer").stop();


func _on_audio_stream_player_finished():
	get_parent().sceneState += 1;
