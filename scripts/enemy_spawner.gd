extends Node2D

var enemy_scene = preload("res://scenes/enemy.tscn")
var enemy_path = preload("res://scenes/enemy_path.tscn")
@onready var spawn_positions: Node = $SpawnPositions #This basically gets all of the children nodes under SpawnPositions like an array\list.
signal enemy_spawned(enemy_instance) #We're creating this so that we can pass enemies along to the Main.gd script because the enemy is emitting a signal to let us know that it died and we need to pass that through here.
signal enemy_path_spawned(enemy_path_instance)

# Calling that signal _on_timer_timeout.
func _on_timer_timeout():
	spawn_enemy()
	
#Spawn an enemy on one of the spawn position nodes everytime the timer runs out in spawner scene.
func spawn_enemy():
	var positions_array: Array = spawn_positions.get_children() #Get the Array/List.
	var random_position: Object = positions_array.pick_random() #Pick one of the array elements at random each time its called.
	var enemy_instance = enemy_scene.instantiate()
	enemy_instance.global_position = random_position.global_position
	emit_signal("enemy_spawned", enemy_instance) #Emit signal that takes an arguement, and does its thing to spawn enemies.
	
func _on_enemy_path_timer_timeout():
	spawn_enemy_path()

func spawn_enemy_path():
	var enemy_path_instance = enemy_path.instantiate()
	emit_signal("enemy_path_spawned", enemy_path_instance)


