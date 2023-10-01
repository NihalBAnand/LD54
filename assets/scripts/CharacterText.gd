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
