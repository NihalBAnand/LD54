extends CharacterBody2D


@export var enemyBullet: PackedScene
@onready var spawn_point: Marker2D = $enemyBullletSpawn

const speed = 1

@export var player: PackedScene

var health = 100

func _physics_process(delta):
	if abs(get_parent().get_node("Player").global_position.x - global_position.x) < 5:
		self.position.x += 0;
	elif  get_parent().get_node("Player").global_position.x> self.global_position.x:
		self.position.x += speed
	elif get_parent().get_node("Player").global_position.x < self.global_position.x:
		self.position.x -= speed
	

	#print("fkjadsfjdskjafjkl")

	move_and_slide()


func _on_shoot_timer_timeout():
	shoot() # Replace with function body.


func shoot():
	var b: enemyBullet = enemyBullet.instantiate()
	owner.add_child(b)
	b.transform = spawn_point.global_transform


func applyDamage(damage: float) -> void:
	health-= damage
	if health<=0:
		queue_free()
	print(health)
