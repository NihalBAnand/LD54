extends Label

var currentTextPos = 0;
var currentDialogueItem = 0;

var dialogue = ["I used to be a ranger, way out in Arizona.", "Got into many a tussle with a hotblooded outlaw in my time, and I got the notches and scars to prove it.", "I’m moving out to Texas now, to settle down in a small town, and build a new life away from the fightin’ and killin’.", "I’m sure that from now on, my life will be peaceful."];

var audioOptions = [load("res://assets/sounds/keypress1.mp3"), load("res://assets/sounds/keypress2.mp3"), load("res://assets/sounds/keypress3.mp3")];

var spacebarOn = true;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (currentTextPos < dialogue[currentDialogueItem].length() && get_node("TextTimer").time_left <= 0):
		get_node("TextTimer").start();
		get_parent().get_node("SpacebarPrompt").visible = false;
	else:
		get_parent().get_node("SpacebarPrompt").visible = true;

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_SPACE:
			text = "";
			currentDialogueItem += 1;
			currentTextPos = 0;
			if (currentDialogueItem >= dialogue.size()):
				get_tree().change_scene_to_file("res://Scenes/TheNextDay.tscn");


func _on_timer_timeout():
	if (spacebarOn):
		get_parent().get_node("SpacebarPrompt").texture = load("res://assets/Art/Blank.png");
		spacebarOn = false;
	else:
		get_parent().get_node("SpacebarPrompt").texture = load("res://assets/Art/Spacebar.png");
		spacebarOn = true;


func _on_text_timer_timeout():
	if (currentTextPos < dialogue[currentDialogueItem].length()):
		text += dialogue[currentDialogueItem][currentTextPos];
		currentTextPos += 1;
	
		audioOptions.shuffle();
		get_node("AudioStreamPlayer").stream = audioOptions[0];
		if (!get_node("AudioStreamPlayer").playing):
			get_node("AudioStreamPlayer").play();
