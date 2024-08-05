extends Area2D

@export var enemy_speed: int = 300 #This is 800 pixels per second.
signal died

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _physics_process(delta):
	global_position.x += -enemy_speed * delta #Similar to C# Unity's time.deltatime calculation.

#Kill the enemy. Kill it dead.
func die():
	queue_free()
	emit_signal("died")
	
func _on_body_entered(body):
	body.take_damage()
	die()
