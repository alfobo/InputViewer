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
					print(bID[i])
					$"face/face-pressed-down".visible = true
				1:	# B
					print(bID[i])
					$"face/face-pressed-right".visible = true
				2:	# X
					print(bID[i])
					$"face/face-pressed-left".visible = true
				3:	# Y
					print(bID[i])
					$"face/face-pressed-up".visible = true
				4:	# Back/Select
					print(bID[i])
					$"face/select/pressed".visible = true
				5:	# Guide/Home
					print(bID[i])
					$"face/guide/pressed".visible = true
				6:	# Start
					print(bID[i])
					$"face/face-start/pressed".visible = true
				7:	# Left stick
					print(bID[i])
					$analog/leftAnalog/stick/button.visible = true
				8:	# Right stick
					print(bID[i])
					$analog/rightAnalog/stick/button.visible = true
				9:	# Left shoulder
					timeActive = true
					pressTime(delta,$watches/shoulderLeft,9)
					print(bID[i])
					$"shoulder/shoulder-left/pressed".visible = true
				10:	# Right shoulder
					timeActive = true
					pressTime(delta,$watches/shoulderRight,10)
					print(bID[i])
					$"shoulder/shoulder-right/pressed".visible = true
				11:	# Dpad up
					print(bID[i])
					$dpad/dUp.visible = true
				12:	# Dpad down
					print(bID[i])
					$dpad/dDown.visible = true
				13:	# Dpad left
					print(bID[i])
					$dpad/dLeft.visible = true
				14:	# Dpad right
					print(bID[i])
					$dpad/dRight.visible = true
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
				0:
					$"face/face-pressed-down".visible = false
				1:
					$"face/face-pressed-right".visible = false
				2:
					$"face/face-pressed-left".visible = false
				3:
					$"face/face-pressed-up".visible = false
				4:	# Back/Select
					$"face/select/pressed".visible = false
				5:	# Guide/Home
					$"face/guide/pressed".visible = false
				6:	# Start
					$"face/face-start/pressed".visible = false
				7:
					$analog/leftAnalog/stick/button.visible = false
				8:
					$analog/rightAnalog/stick/button.visible = false
				9:
					time[9] = 0
					timeActive = false
					$"shoulder/shoulder-left/pressed".visible = false
				10:
					time[10] = 0
					timeActive = false
					$"shoulder/shoulder-right/pressed".visible = false
				11:
					$dpad/dUp.visible = false
				12:
					$dpad/dDown.visible = false
				13:
					$dpad/dLeft.visible = false
				14:
					$dpad/dRight.visible = false

func pressTime(delta,label,array):
	if (timeActive && label.visible):
		time[array]+=delta
		label.text = str(time[array]).pad_decimals(5)+"s"

func _on_options_raw_input(state):
	# TODO: use a for loop
	match state:
		true:
			for child in $watches.get_children():
				child.visible = true
				child.text = "0.00000"
		false:
			for child in $watches.get_children():
				child.visible = false

func _on_options_logs(state):
	match state:
		true:
			$notice.visible = true
			$notice.text = "Feature not yet implemented"
		false:
			$notice.visible = false
