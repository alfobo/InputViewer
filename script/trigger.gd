extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	# Left trigger
	if(Input.get_joy_axis(0,4)):
		print("Left trig: ",Input.get_joy_axis(0,4))
		$left/bar.scale.y = Input.get_joy_axis(0,4)
	else:
		$left/bar.scale.y = 0
	# Right trigger
	if(Input.get_joy_axis(0,5)): 
		print("Right trig: ",Input.get_joy_axis(0,5))
		$right/bar.scale.y = Input.get_joy_axis(0,5)
	else:
		$right/bar.scale.y = 0
