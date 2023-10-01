extends Node2D

@export var sceneState = 1; 

# Called when the node enters the scene tree for the first time.
func _ready():
	sceneState = 1;


func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_SPACE:
			sceneState += 1;
			if (sceneState > 7):
				sceneState = 1;
				get_node("/root/Global").currentCharacter += 1;
				if (get_node("/root/Global").currentCharacter > 6):
					get_node("/root/Global").currentCharacter = 0;
				get_tree().change_scene_to_file("res://Scenes/shooter.tscn");
