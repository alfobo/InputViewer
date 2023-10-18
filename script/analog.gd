extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Left stick
	if(Input.get_joy_axis(0,0) || Input.get_joy_axis(0,1)):
		print("Left joy: ",Input.get_joy_axis(0,0),", ",Input.get_joy_axis(0,1))
		$leftAnalog/stick.position = 40*Vector2(Input.get_joy_axis(0,0),Input.get_joy_axis(0,1))
	else:
		$leftAnalog/stick.position = Vector2()
	# Right stick
	if(Input.get_joy_axis(0,2) || Input.get_joy_axis(0,3)):
		print("Right joy: ",Input.get_joy_axis(0,2),", ",Input.get_joy_axis(0,3))
		$rightAnalog/stick.position = 40*Vector2(Input.get_joy_axis(0,2),Input.get_joy_axis(0,3))
	else:
		$rightAnalog/stick.position = Vector2()
