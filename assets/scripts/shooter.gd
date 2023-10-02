extends Node2D

var currentLevel = null;
var loadedLevel = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (!loadedLevel):
		match get_node("/root/Global").currentCharacter:
			1:
				currentLevel = load("res://assets/prefabs/Levels/level_1.tscn").instantiate();
				add_child(currentLevel);
				move_child(currentLevel, 0);
				
				var enemy = load("res://assets/prefabs/Enemies and Players/baseEnemy.tscn").instantiate();
				add_child(enemy);
				enemy.position = get_node("EnemySpawn").position;
				enemy.scale = Vector2(0.6, 0.6);
			2:
				currentLevel = load("res://assets/prefabs/Levels/level_2.tscn").instantiate();
				add_child(currentLevel);
				move_child(currentLevel, 0);
				
				var enemy = load("res://assets/prefabs/Enemies and Players/baseEnemy.tscn").instantiate();
				add_child(enemy);
				enemy.position = get_node("EnemySpawn").position;
				enemy.scale = Vector2(0.6, 0.6);
			3:
				currentLevel = load("res://assets/prefabs/Levels/level_3.tscn").instantiate();
				add_child(currentLevel);
				move_child(currentLevel, 0);
				
				var enemy = load("res://assets/prefabs/Enemies and Players/moveEnemy.tscn").instantiate();
				add_child(enemy);
				enemy.position = get_node("EnemySpawn").position;
				enemy.scale = Vector2(0.6, 0.6);
			4:
				currentLevel = load("res://assets/prefabs/Levels/level_4.tscn").instantiate();
				add_child(currentLevel);
				move_child(currentLevel, 0);
				
				var enemy = load("res://assets/prefabs/Enemies and Players/moveEnemy.tscn").instantiate();
				add_child(enemy);
				enemy.position = get_node("EnemySpawn").position;
				enemy.scale = Vector2(0.6, 0.6);
			5:
				currentLevel = load("res://assets/prefabs/Levels/level_5.tscn").instantiate();
				add_child(currentLevel);
				move_child(currentLevel, 0);
				
				var enemy = load("res://assets/prefabs/Enemies and Players/patrolEnemy.tscn").instantiate();
				add_child(enemy);
				enemy.position = get_node("EnemySpawn").position;
				enemy.scale = Vector2(0.6, 0.6);
			6:
				currentLevel = load("res://assets/prefabs/Levels/level_6.tscn").instantiate();
				add_child(currentLevel);
				move_child(currentLevel, 0);
				
				var enemy = load("res://assets/prefabs/Enemies and Players/patrolEnemy.tscn").instantiate();
				add_child(enemy);
				enemy.position = get_node("EnemySpawn").position;
				enemy.scale = Vector2(0.6, 0.6);
			7:
				currentLevel = load("res://assets/prefabs/Levels/level_7.tscn").instantiate();
				add_child(currentLevel);
				move_child(currentLevel, 0);
				
				var enemy = load("res://assets/prefabs/Enemies and Players/smartEnemy.tscn").instantiate();
				add_child(enemy);
				enemy.position = get_node("EnemySpawn").position;
				enemy.scale = Vector2(0.6, 0.6);
		
		loadedLevel = true;
