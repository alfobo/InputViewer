extends Node

signal analogDataL(data)
signal analogDataR(data)
var device
var stickRight
var stickLeft

func _ready():
	if (OS.get_name() == "Linux"):
		device = 3
	elif(OS.get_name() == "Windows"):
		device = 0
	var leftStick
	pass # Replace with function body.

func _process(delta):
	stickLeft = Vector2(Input.get_joy_axis(device,0),Input.get_joy_axis(device,1))
	stickRight = Vector2(Input.get_joy_axis(device,2),Input.get_joy_axis(device,3))
	# Left stick
	if(stickLeft.length() > 0.0001):
		print("Left joy: ",stickLeft)
		$leftAnalog/stick.position = 40*stickLeft
		emit_signal("analogDataL",stickLeft)
	else:
		$leftAnalog/stick.position = Vector2()
		emit_signal("analogDataL",Vector2())
	# Right stick
	if(stickRight.length() > 0.0001):
		print("Right joy: ",stickRight)
		$rightAnalog/stick.position = 40*stickRight
		emit_signal("analogDataR",stickRight)
	else:
		$rightAnalog/stick.position = Vector2()
		emit_signal("analogDataR",Vector2())
