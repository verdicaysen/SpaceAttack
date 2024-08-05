extends Node2D

var score: int = 0
var lives: int = 3
@onready var player = $Player #Create a reference of the player node in the scene. Like a delagate.

func _on_player_took_damage():
	lives -= 1
	if lives == 0:
		print("Game Over")
		player.die()
	else:
		print("Player has", lives, " lives left.")
	
