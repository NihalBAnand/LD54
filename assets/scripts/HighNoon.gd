extends Node2D

@export var sceneState = 1; 

# Called when the node enters the scene tree for the first time.
func _ready():
	sceneState = 1;


func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_SPACE:
			sceneState += 1;
