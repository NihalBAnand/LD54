extends Label

var alreadyInited = false;
var currentTextPos = 0;

var audioOptions = [load("res://assets/sounds/keypress1.mp3"), load("res://assets/sounds/keypress2.mp3"), load("res://assets/sounds/keypress3.mp3")];

@export var dialogue = "";

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (get_parent().get_parent().visible):
		if (get_parent().get_parent().get_parent().sceneState == 5):
			dialogue = get_node("/root/Global").characterDialogue[get_node("/root/Global").currentCharacter];
		else:
			if (get_node("/root/Global").currentCharacter == 3):
				dialogue = "Well, well, well, if it ain't [Insert Name Here]. This town ain't big enough for the both of us, pardner. *spit*";
			else:
				dialogue = "Well, well, well, if it ain't the Arizona Ranger. This town ain't big enough for the both of us, pardner. *spit*";
		
		if (!alreadyInited):
			alreadyInited = true;
			text = "";
			currentTextPos = 0;
		else:
			if (currentTextPos < dialogue.length() && get_node("Timer").time_left <= 0):
				get_parent().get_node("SpacebarPrompt").visible = false;
				get_node("Timer").start();
			elif (currentTextPos >= dialogue.length()):
				get_parent().get_node("SpacebarPrompt").visible = true;
	else:
		alreadyInited = false;


func _on_timer_timeout():
	text += dialogue[currentTextPos];
	currentTextPos += 1;
	
	get_parent().get_node("SpacebarPrompt").visible = false;
	
	audioOptions.shuffle();
	get_node("AudioStreamPlayer").stream = audioOptions[0];
	if (!get_node("AudioStreamPlayer").playing):
		get_node("AudioStreamPlayer").play();
