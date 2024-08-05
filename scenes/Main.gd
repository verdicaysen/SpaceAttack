extends Node2D

var lives: int = 3
@onready var player = $Player #Create a reference of the player node in the scene. Like a delagate.

func _on_player_took_damage():
	lives -= 1
	if lives == 0:
		print("Game Over")
		player.die()
	print("Player has", lives, " lives left.")
	
