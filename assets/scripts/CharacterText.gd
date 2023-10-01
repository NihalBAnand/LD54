extends Label

var alreadyInited = false;
var currentTextPos = 0;

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
			if (currentTextPos < dialogue.length()):
				text += dialogue[currentTextPos];
				currentTextPos += 1;
	else:
		alreadyInited = false;
