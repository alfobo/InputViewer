extends Node

signal analogData(data)
var device

func _ready():
	if (OS.get_name() == "Linux"):
		device = 3
	elif(OS.get_name() == "Windows"):
		device = 0
	pass # Replace with function body.

func _process(delta):
	# Left stick
	if(Input.get_joy_axis(device,0) || Input.get_joy_axis(device,1)):
		emit_signal("analogData",Vector2(Input.get_joy_axis(device,0),Input.get_joy_axis(device,1)))
		print("Left joy: ",Vector2(Input.get_joy_axis(device,0),Input.get_joy_axis(device,1)))
		$leftAnalog/stick.position = 40*Vector2(Input.get_joy_axis(device,0),Input.get_joy_axis(device,1))
	else:
		$leftAnalog/stick.position = Vector2()
	# Right stick
	if(Input.get_joy_axis(device,2) || Input.get_joy_axis(device,3)):
		emit_signal("analogData",Vector2(Input.get_joy_axis(device,2),Input.get_joy_axis(device,3)))
		print("Right joy: ",Vector2(Input.get_joy_axis(device,2),Input.get_joy_axis(device,3)))
		$rightAnalog/stick.position = 40*Vector2(Input.get_joy_axis(device,2),Input.get_joy_axis(device,3))
	else:
		emit_signal("analogData",Vector2())
		$rightAnalog/stick.position = Vector2()
