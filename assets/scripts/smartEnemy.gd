extends CharacterBody2D


@export var enemyBullet: PackedScene
@onready var spawn_point: Marker2D = $enemyBulletSpawn

const speed = 3;
var dir = 1;

var timerOn = false;

@export var player: PackedScene

var health = 100

func _physics_process(delta):
	if !timerOn:
		if abs(get_parent().get_node("Level" + str(get_node("/root/Global").currentCharacter) + "/PatrolPoint1").global_position.x - global_position.x) < 5 || abs(get_parent().get_node("Level" + str(get_node("/root/Global").currentCharacter) + "/PatrolPoint2").global_position.x - global_position.x) < 5:
			timerOn = true;
			dir *= -1;
			get_node("waitTimer").start();
		if abs(get_parent().get_node("Level" + str(get_node("/root/Global").currentCharacter) + "/ShootPoint1").global_position.x - global_position.x) < 5 || abs(get_parent().get_node("Level" + str(get_node("/root/Global").currentCharacter) + "/ShootPoint2").global_position.x - global_position.x) < 5:
			timerOn = true;
			get_node("waitTimer").start();
		else:
			position.x += speed * dir;
		

	move_and_slide()


func _on_shoot_timer_timeout():
	shoot() # Replace with function body.


func shoot():
	var b: enemyBullet = enemyBullet.instantiate()
	get_parent().add_child(b);
	b.global_transform = spawn_point.global_transform
	
	var smoke = load("res://assets/prefabs/Enemies and Players/Smoke.tscn").instantiate();
	add_child(smoke);
	smoke.position = spawn_point.position;
	
	if (!get_node("AudioStreamPlayer").playing):
		get_node("AudioStreamPlayer").play();


func applyDamage(damage: float) -> void:
	health -= damage
	if health<=0:
		get_tree().change_scene_to_file("res://Scenes/Epilogue.tscn");
		queue_free()
	print(health)


func _on_wait_timer_timeout():
	timerOn = false;
