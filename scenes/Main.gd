extends Node2D

var score: int = 0
var lives: int = 3
@onready var player = $Player #Create a reference of the player node in the scene. Like a delagate.
@onready var hud = $UI/HUD #Tie the UI and then the master scene HUD

#Let's initialize score to the hud.
func _ready():
	hud.set_score_label(score)

func _on_player_took_damage():
	lives -= 1
	if lives == 0:
		print("Game Over")
		player.die()
	else:
		print("Player has", lives, " lives left.")
		
func _on_enemy_spawner_enemy_spawned(enemy_instance):
	enemy_instance.connect("died", _on_enemy_died)
	add_child(enemy_instance) #This is coming from the enemy_spawner.gd script.

func _on_enemy_died():
	score += 100
	hud.set_score_label(score)
