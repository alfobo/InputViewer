extends Node

signal chromaChange(chroma)
signal inputData(state)
signal logs(state)
var button_pressed
var path
var settings

func _ready():
	button_pressed = false
	settings = ConfigFile.new()
	path = "user://settings.cfg"
	loadData()

	#DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED) 
	#DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)

func resolution(width, height):
	get_viewport().size = Vector2(width,height)

func _on_resolution_item_selected(index):
	match index:
		1:
			resolution(1280,720)
		2:
			resolution(1920,1080)
		3:
			resolution(2560,1440)
		4:
			resolution(3840,2160)
	settings.set_value("Setting","resolution",index)
	save()
	
func _on_chroma_item_selected(index):
	match index:
		1:
			emit_signal("chromaChange",null)
		2:
			emit_signal("chromaChange","blue")
		3:
			emit_signal("chromaChange","green")
	settings.set_value("Setting","chroma",index)
	save()
	
func _on_inputs_toggled(button_pressed):
	emit_signal("inputData",button_pressed)
	settings.set_value("Setting","inputsToggle",button_pressed)
	save()

func _on_line_edit_text_submitted(new_text):
	Engine.max_fps = int(new_text)
	settings.set_value("Setting","fpsCap",Engine.max_fps)
	save()

func save():
	settings.save(path)

func loadData():
	settings.load(path)
	var res = settings.get_value("Setting","resolution")
	var chroma = settings.get_value("Setting","chroma")
	var toggleState = settings.get_value("Setting","inputsToggle")
	var fps = settings.get_value("Setting","fpsCap")
	
	_on_resolution_item_selected(res)
	_on_chroma_item_selected(chroma)
	_on_inputs_toggled(toggleState)
	_on_line_edit_text_submitted(fps)
	
	$Resolution.select(res)
	$Chroma.select(chroma)
	$inputs.button_pressed = toggleState
	$ColorRect/LineEdit.text = str(fps)
