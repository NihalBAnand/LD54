extends CharacterBody2D


@export var enemyBullet: PackedScene
@onready var spawn_point: Marker2D = $enemyBulletSpawn

const speed = 2;

@export var player: PackedScene

var health = 100

func _physics_process(delta):
	if get_parent().get_node("Player"):
		if abs(get_parent().get_node("Player").global_position.x - global_position.x) < 5:
			self.position.x += 0;
			get_node("Sprite2D").play("idle");
		elif  get_parent().get_node("Player").global_position.x> self.global_position.x:
			self.position.x += speed
			get_node("Sprite2D").play("walk");
		elif get_parent().get_node("Player").global_position.x < self.global_position.x:
			self.position.x -= speed
			get_node("Sprite2D").play("walk");
		

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
	health-= damage
	if health<=0:
		get_tree().change_scene_to_file("res://Scenes/AnotherNotch.tscn");
		queue_free()
	print(health)
