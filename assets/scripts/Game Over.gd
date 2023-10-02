extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_SPACE:
			get_tree().change_scene_to_file("res://Scenes/Intro.tscn");


func _on_timer_timeout():
	get_node("TextureRect").visible = !get_node("TextureRect").visible;
