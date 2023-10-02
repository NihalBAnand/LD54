extends StaticBody2D

var dir = 1;
var canTurn = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translate(Vector2(-1 * dir, 0));
	if (global_position.x < (0 - (1125 / scale.x)) || global_position.x > (2000 + (1125 / scale.x))) && canTurn:
		dir *= -1;
		get_node("Sprite2D").flip_h = !get_node("Sprite2D").flip_h;
		canTurn = false;
		get_node("Sprite2D/Sprite2D").position.x *= -1;
		get_node("Sprite2D/Sprite2D2").position.x *= -1;		
		get_node("Timer").start();


func _on_timer_timeout():
	canTurn = true;
	
	
