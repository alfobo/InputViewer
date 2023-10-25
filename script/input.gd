extends Node

var bID
var b = []
var time = []
var timeActive = false
	
# Called when the node enters the scene tree for the first time.
func _ready():
	$"face/face-pressed-up".visible = false
	$"face/face-pressed-down".visible = false
	$"face/face-pressed-right".visible = false
	$"face/face-pressed-left".visible = false
	$"shoulder/shoulder-left/pressed".visible = false
	$"shoulder/shoulder-right/pressed".visible = false
	$analog/leftAnalog/stick/button.visible = false
	$analog/rightAnalog/stick/button.visible = false
	$dpad/dUp.visible = false
	$dpad/dDown.visible = false
	$dpad/dLeft.visible = false
	$dpad/dRight.visible = false
	
	for child in $watches.get_children():
		child.visible = false
		
	print(Input.get_joy_name(0))
	
	bID = [
		"A","B","X","Y","BACK","GUIDE","START",
		"LBUT_STICK","RBUT_STICK","L_SHLD",
		"R_SHLD","U_DPAD","D_DPAD","L_DPAD",
		"R_DPAD","MISC1"
		]
	for i in bID.size():
		b.append(i)
		time.append(0.0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#func _physics_process(delta):
	controllerInputs(delta)
	
# Change sprite visibility state depending if a button is pressed or not
func controllerInputs(delta):
	for i in range(b.size()):
		if (Input.is_joy_button_pressed(0,b[i])):
			match b[i]:
				0:	# A
					pressTime(delta,$watches/faceDown,0,true)
					print(bID[i])
					$"face/face-pressed-down".visible = true
				1:	# B
					pressTime(delta,$watches/faceRight,1,true)
					print(bID[i])
					$"face/face-pressed-right".visible = true
				2:	# X
					pressTime(delta,$watches/faceLeft,2,true)
					print(bID[i])
					$"face/face-pressed-left".visible = true
				3:	# Y
					pressTime(delta,$watches/faceUp,3,true)
					print(bID[i])
					$"face/face-pressed-up".visible = true
				4:	# Back/Select
					pressTime(delta,$watches/select,4,true)
					print(bID[i])
					$"face/select/pressed".visible = true
				5:	# Guide/Home
					pressTime(delta,$watches/guide,5,true)
					print(bID[i])
					$"face/guide/pressed".visible = true
				6:	# Start
					pressTime(delta,$watches/start,6,true)
					print(bID[i])
					$"face/face-start/pressed".visible = true
				7:	# Left stick
					pressTime(delta,$watches/stickLeft,7,true)
					print(bID[i])
					$analog/leftAnalog/stick/button.visible = true
				8:	# Right stick
					pressTime(delta,$watches/stickRight,8,true)
					print(bID[i])
					$analog/rightAnalog/stick/button.visible = true
				9:	# Left shoulder
					pressTime(delta,$watches/shoulderLeft,9,true)
					print(bID[i])
					$"shoulder/shoulder-left/pressed".visible = true
				10:	# Right shoulder
					pressTime(delta,$watches/shoulderRight,10,true)
					print(bID[i])
					$"shoulder/shoulder-right/pressed".visible = true
				11:	# Dpad up
					pressTime(delta,$watches/dUp,11,true)
					print(bID[i])
					$dpad/dUp.visible = true
				12:	# Dpad down
					pressTime(delta,$watches/dDown,12,true)
					print(bID[i])
					$dpad/dDown.visible = true
				13:	# Dpad left
					pressTime(delta,$watches/dLeft,13,true)
					print(bID[i])
					$dpad/dLeft.visible = true
				14:	# Dpad right
					pressTime(delta,$watches/dRight,14,true)
					print(bID[i])
					$dpad/dRight.visible = true
				# Past here, I can't test
				15:	# Misc1
					print(bID[i])
					$"face/face-misc".modulate = Color.GREEN
				16:# Paddle 1
					print(bID[i])
					$paddle/paddle1.modulate = Color.GREEN
				17:# Paddle 2
					print(bID[i])
					$paddle/paddle2.modulate = Color.GREEN
				18:# Paddle 3
					print(bID[i])
				19:# Paddle 4
					print(bID[i])
		if(!Input.is_joy_button_pressed(0,b[i])):
			match b[i]:
				0:	# A
					pressTimeStop(0)
					$"face/face-pressed-down".visible = false
				1:	# B
					pressTimeStop(1)
					$"face/face-pressed-right".visible = false
				2:	# X
					pressTimeStop(2)
					$"face/face-pressed-left".visible = false
				3:	# Y
					pressTimeStop(3)
					$"face/face-pressed-up".visible = false
				4:	# Back/Select
					pressTimeStop(4)
					$"face/select/pressed".visible = false
				5:	# Guide/Home
					pressTimeStop(5)
					$"face/guide/pressed".visible = false
				6:	# Start
					pressTimeStop(6)
					$"face/face-start/pressed".visible = false
				7:	# Left stick button
					pressTimeStop(7)
					$analog/leftAnalog/stick/button.visible = false
				8:	# Right stick button
					pressTimeStop(8)
					$analog/rightAnalog/stick/button.visible = false
				9:	# Left shoulder
					pressTimeStop(9)
					$"shoulder/shoulder-left/pressed".visible = false
				10:	# Right shoulder
					pressTimeStop(10)
					$"shoulder/shoulder-right/pressed".visible = false
				11:
					pressTimeStop(11)
					$dpad/dUp.visible = false
				12:
					pressTimeStop(12)
					$dpad/dDown.visible = false
				13:
					pressTimeStop(13)
					$dpad/dLeft.visible = false
				14:
					pressTimeStop(14)
					$dpad/dRight.visible = false
					
func pressTime(delta,label,array,timeActive):
	if (timeActive && label.visible):
		time[array]+=delta
		label.text = str(time[array]).pad_decimals(5)+"s"
		
func pressTimeStop(array):
	time[array] = 0
	timeActive = false
	
func _on_options_logs(state):
	match state:
		true:
			$notice.visible = true
			$notice.text = "Feature not yet implemented"
		false:
			$notice.visible = false

func _on_options_input_data(state):
	match state:
		true:
			for child in $watches.get_children():
				child.visible = true
				child.text = "0.00000s"
		false:
			for child in $watches.get_children():
				child.visible = false
