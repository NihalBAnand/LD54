extends CharacterBody2D

class_name player

@export var speed = 400
@export var bullet: PackedScene
var ammo
@onready var spawn_point: Marker2D = $BulletSpawn

var health = 30
var delayTimer = null
var bulletDelay =  .2
var canShoot = true

var reloadVisible = true;

func get_input():
	var input_direction = Input.get_vector("player_left", "player_right", "player_up", "player_down")
	velocity = input_direction * speed
	

func _ready():
	delayTimer = Timer.new()
	delayTimer.set_one_shot(true)
	delayTimer.set_wait_time(bulletDelay)
	delayTimer.timeout.connect(_on_delay_complete)
	add_child(delayTimer)
	ammo = get_node("../ammoGraphic")
	
	
func _process(delta):
	if (ammo.ammo < 0):
		get_parent().get_node("CanvasLayer/ReloadPrompt").visible = true;
	else:
		get_parent().get_node("CanvasLayer/ReloadPrompt").visible = false;

func _physics_process(delta):
	get_input()
	move_and_slide()
	if Input.is_action_just_pressed("shoot") && (canShoot) && ammo.ammo>=0: shoot()
	
	if Input.is_action_just_pressed("reload"):
		ammo.updateAmmo(true)
		
	if velocity != Vector2(0, 0):
		get_node("Mc").play("walk");
	else:
		get_node("Mc").play("idle");


func shoot():
	var b: bullet = bullet.instantiate()
	owner.add_child(b)
	b.transform = spawn_point.global_transform
	ammo.updateAmmo(false)
	canShoot = false
	delayTimer.start()
	
	

func _on_delay_complete():
	canShoot = true
	
	

func applyDamage(damage: float) -> void:
	health-= damage
	get_node("../healthGraphic").updateHealth()
	if health<=0:
		queue_free()
	print("player health: ")
	print(health)



func _on_reload_prompt_timer_timeout():
	if (reloadVisible):
		get_parent().get_node("CanvasLayer/ReloadPrompt").texture = load("res://assets/Art/Blank.png");
		reloadVisible = false;
	else:
		get_parent().get_node("CanvasLayer/ReloadPrompt").texture = load("res://assets/Art/R.png");
		reloadVisible = true;
