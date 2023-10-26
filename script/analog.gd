extends Node

signal analogData(data)

func _ready():
	pass # Replace with function body.

func _process(delta):
	# Left stick
	if(Input.get_joy_axis(0,0) || Input.get_joy_axis(0,1)):
		emit_signal("analogData",Vector2(Input.get_joy_axis(0,0),Input.get_joy_axis(0,1)))
		print("Left joy: ",Vector2(Input.get_joy_axis(0,0),Input.get_joy_axis(0,1)))
		$leftAnalog/stick.position = 40*Vector2(Input.get_joy_axis(0,0),Input.get_joy_axis(0,1))
	else:
		$leftAnalog/stick.position = Vector2()
	# Right stick
	if(Input.get_joy_axis(0,2) || Input.get_joy_axis(0,3)):
		emit_signal("analogData",Vector2(Input.get_joy_axis(0,2),Input.get_joy_axis(0,3)))
		print("Right joy: ",Vector2(Input.get_joy_axis(0,2),Input.get_joy_axis(0,3)))
		$rightAnalog/stick.position = 40*Vector2(Input.get_joy_axis(0,2),Input.get_joy_axis(0,3))
	else:
		emit_signal("analogData",Vector2())
		$rightAnalog/stick.position = Vector2()
