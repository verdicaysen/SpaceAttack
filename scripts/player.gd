extends CharacterBody2D

var speed= 400

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
