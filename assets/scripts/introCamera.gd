extends Camera2D

func _process(delta):
	zoom *= 1.0001
	position = Vector2(800, 450 + (0.5 * (DisplayServer.window_get_size().y - (get_viewport().get_visible_rect().size.y / zoom.y))));
	print((get_viewport().get_visible_rect().size.y / zoom.y));
