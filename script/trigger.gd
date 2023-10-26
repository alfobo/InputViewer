extends Node

signal triggerData(data)

func _ready():
	pass

func _process(delta):
	# Left trigger
	if(Input.get_joy_axis(0,4)):
		emit_signal("triggerData",Input.get_joy_axis(0,4))
		print("Left trig: ",Input.get_joy_axis(0,4))
		$left/bar.scale.y = Input.get_joy_axis(0,4)
	else:
		emit_signal("triggerData",Input.get_joy_axis(0,4))
		$left/bar.scale.y = 0
	# Right trigger
	if(Input.get_joy_axis(0,5)): 
		emit_signal("triggerData",Input.get_joy_axis(0,5))
		print("Right trig: ",Input.get_joy_axis(0,5))
		$right/bar.scale.y = Input.get_joy_axis(0,5)
	else:
		$right/bar.scale.y = 0
