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

#If the x position goes below zero go back to zero so you can't leave the viewport on the x axis.
    if global_position.x < 0:
        global_position.x = 0
    if global_position.x > 1280:
        global_position.x = 1280
    if global_position.y < 0:
        global_position.y = 0
    if global_position.y > 720:
        global_position.y = 720
    print(global_position)

