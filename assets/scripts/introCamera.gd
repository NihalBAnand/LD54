extends Camera2D

var zoomAccel = 1;

func _process(delta):
	zoom *= 1 + (0.0001 * zoomAccel);
	position = Vector2(1000, 500 + (0.2 * (DisplayServer.window_get_size().y - (get_viewport().get_visible_rect().size.y / zoom.y))));
	zoomAccel += 0.01;

