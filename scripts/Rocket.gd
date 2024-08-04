extends Area2D

@export var rocket_speed: int = 800 #This is 800 pixels per second.
@onready var visible_notifier = $VisibleNotifier #Getting that there node without heavy syntax.

func _ready():
	visible_notifier.connect("screen_exited", _on_screen_exited) #Connecting signals without using the GUI.

func _physics_process(delta):
	global_position.x += rocket_speed * delta #Similar to C# Unity's time.deltatime calculation.

func _on_screen_exited():
	queue_free() #Call this to remove the attached node.
	print("Rocket removed.") #Confirm its removed.
