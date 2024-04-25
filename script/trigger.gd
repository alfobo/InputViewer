extends Node

signal triggerData(data)
var device

func _ready():
	if(OS.get_name() == "Linux"):
		device = 3
	elif(OS.get_name() == "Windows"):
		device = 0
	pass

func _process(delta):
	# Left trigger
	if(Input.get_joy_axis(device,4)):
		emit_signal("triggerData",Input.get_joy_axis(device,4))
		print("Left trig: ",Input.get_joy_axis(device,4))
		$left/bar.scale.y = Input.get_joy_axis(device,4)
	else:
		emit_signal("triggerData",Input.get_joy_axis(device,4))
		$left/bar.scale.y = 0
	# Right trigger
	if(Input.get_joy_axis(device,5)): 
		emit_signal("triggerData",Input.get_joy_axis(device,5))
		print("Right trig: ",Input.get_joy_axis(device,5))
		$right/bar.scale.y = Input.get_joy_axis(device,5)
	else:
		$right/bar.scale.y = 0
