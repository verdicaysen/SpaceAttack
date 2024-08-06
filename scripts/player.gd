extends CharacterBody2D

#Preload this as a global variable so you're only loading the file once into memory.
var rocket_scene = preload("res://scenes/Rocket.tscn")
@onready var rocket_container = $RocketContainer #This is like get_node("RocketContainer)You can do this instead of having your node references loaded under the func _ready(): function.
@onready var rocket_sound = $RocketSound

signal took_damage

func _process(delta):
	if Input.is_action_just_pressed("fire"):
		_fire()
# Speed variable for how fast we can move.
var speed= 400

#Setup the controls of our movement by calling the built in physics process and assigning inputs.
func _physics_process(delta):
	velocity = Vector2(0,0)
		
	if Input.is_action_pressed("Up"):
		velocity.y = -speed
	if Input.is_action_pressed("Down"):
		velocity.y = speed
	if Input.is_action_pressed("Left"):
		velocity.x = -speed
	if Input.is_action_pressed("Right"):
		velocity.x = speed
	move_and_slide()

	var screen_size = get_viewport_rect().size #Get screen size from Godot.
#Now clamp it. If the x position goes below zero go back to zero so you can't leave the viewport on the x axis.

	global_position = global_position.clamp(Vector2(0,0), screen_size)

#Tell the game what to do when the process function library calls _fire.
func _fire():
	var rocket_instance = rocket_scene.instantiate()
	rocket_container.add_child(rocket_instance)
	rocket_instance.global_position = global_position
	rocket_instance.global_position.x +=50
	rocket_sound.play()

func take_damage():
	emit_signal("took_damage")
	
func die():
	queue_free()



