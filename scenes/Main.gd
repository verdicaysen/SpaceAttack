extends Node2D

var score: int = 0
var lives: int = 3
@onready var player = $Player #Create a reference of the player node in the scene. Like a delagate.
@onready var hud = $UI/HUD #Tie the UI and then the master scene HUD
@onready var ui = $UI
@onready var enemy_hit_sound = $EnemyHitSound #Reference the Audio node we created by name to create this variable for calling below.
@onready var explode_sound = $Explode
var gameover_scene = preload("res://scenes/game_over_screen.tscn")

#Let's initialize score to the hud.
func _ready():
	hud.set_score_label(score)
	hud.set_lives(lives)

func _on_player_took_damage():
	explode_sound.play()
	lives -= 1
	hud.set_lives(lives)
	if lives == 0:
		player.die()
		await get_tree().create_timer(2).timeout #Wait two seconds before insantiating the gameover scene.
		var gameover_scene = gameover_scene.instantiate()
		gameover_scene.set_score(score)
		ui.add_child(gameover_scene)
		
func _on_enemy_spawner_enemy_spawned(enemy_instance):
	enemy_instance.connect("died", _on_enemy_died)
	add_child(enemy_instance) #This is coming from the enemy_spawner.gd script.

func _on_enemy_died():
	score += 100
	hud.set_score_label(score)
	enemy_hit_sound.play() #Reference the sound var and use the play function in the method.


func _on_enemy_spawner_enemy_path_spawned(enemy_path_instance):
	add_child(enemy_path_instance) #This has to be done before you can run the connect function. Can't use a reference variable before you call that.
	enemy_path_instance.enemy.connect("died", _on_enemy_died)
	
