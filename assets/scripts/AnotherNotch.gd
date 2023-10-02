extends Node2D

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_SPACE:
			get_tree().change_scene_to_file("res://Scenes/TheNextDay.tscn");

func _on_timer_timeout():
	get_node("TextureRect").visible = !get_node("TextureRect").visible 
