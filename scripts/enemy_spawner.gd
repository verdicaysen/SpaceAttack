extends Node2D

var enemy_scene = preload("res://scenes/enemy.tscn")
@onready var spawn_positions: Node = $SpawnPositions #This basically gets all of the children nodes under SpawnPositions like an array\list.

# Calling that signal _on_timer_timeout.
func _on_timer_timeout():
	spawn_enemy()
	
#Spawn an enemy on one of the spawn position nodes everytime the timer runs out in spawner scene.
func spawn_enemy():
	var positions_array: Array = spawn_positions.get_children() #Get the Array/List.
	var random_position: Object = positions_array.pick_random() #Pick one of the array elements at random each time its called.
	var enemy_instance = enemy_scene.instantiate()
	enemy_instance.global_position = random_position.global_position
	add_child(enemy_instance)



