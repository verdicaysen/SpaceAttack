extends Area2D

@export var rocket_speed: int = 800 #This is 800 pixels per second.

func _physics_process(delta):
	global_position.x += rocket_speed * delta #Similar to C# Unity's time.deltatime calculation.
