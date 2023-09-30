extends CharacterBody2D

class_name player

@export var speed = 400
@export var bullet: PackedScene
@onready var spawn_point: Marker2D = $BulletSpawn 

func get_input():
	var input_direction = Input.get_vector("player_left", "player_right", "player_up", "player_down")
	velocity = input_direction * speed
	

func _physics_process(delta):
	get_input()
	move_and_slide()
	if Input.is_action_just_pressed("shoot"): shoot()


func shoot():
	var b: bullet = bullet.instantiate()
	owner.add_child(b)
	b.transform = spawn_point.global_transform
