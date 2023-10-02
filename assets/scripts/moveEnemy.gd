extends CharacterBody2D


@export var enemyBullet: PackedScene
@onready var spawn_point: Marker2D = $enemyBulletSpawn

const speed = 1;
var dir = 1;

var timerOn = false;

@export var player: PackedScene

var health = 100

func _physics_process(delta):
	translate(Vector2(speed * dir, 0));
	
	var collision = move_and_slide();
	if (collision):
		dir *= -1;


func _on_shoot_timer_timeout():
	shoot() # Replace with function body.


func shoot():
	var b: enemyBullet = enemyBullet.instantiate()
	add_child(b)
	b.transform = spawn_point.transform
	
	var smoke = load("res://assets/prefabs/Enemies and Players/Smoke.tscn").instantiate();
	add_child(smoke);
	smoke.position = spawn_point.position;
	
	if (!get_node("AudioStreamPlayer").playing):
		get_node("AudioStreamPlayer").play();


func applyDamage(damage: float) -> void:
	health-= damage
	if health<=0:
		get_tree().change_scene_to_file("res://Scenes/HighNoon.tscn");
		queue_free()
	print(health)


