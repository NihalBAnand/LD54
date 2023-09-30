extends Camera2D

func _process(delta):
	zoom *= 1.001
	position = Vector2(500, 500 + (0.2 * (DisplayServer.window_get_size().y - (get_viewport().get_visible_rect().size.y / zoom.y))));
	print((get_viewport().get_visible_rect().size.y / zoom.y));
