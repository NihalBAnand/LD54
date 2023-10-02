extends Area2D
class_name bullet

var speed: float = 25.0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position += transform.y*speed

func _on_body_entered(body):
	if body.is_in_group("enemies"):
		body.applyDamage(20);
		queue_free();
	elif (body.is_in_group("scenery")):
		queue_free();
