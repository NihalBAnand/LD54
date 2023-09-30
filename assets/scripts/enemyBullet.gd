extends Area2D
class_name enemyBullet

var speed: float = 25.0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position -= transform.y*speed



func _on_body_entered(body):
	if body.is_in_group("ppl"):
		body.applyDamage(10)
	queue_free() # Replace with function body.
