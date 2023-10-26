extends Node

signal chromaChange(chroma)
signal inputData(state)
signal logs(state)

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

func _on_chroma_item_selected(index):
	match index:
		1:
			emit_signal("chromaChange",null)
		2:
			emit_signal("chromaChange","blue")
		3:
			emit_signal("chromaChange","green")

func _on_inputs_toggled(button_pressed):
	emit_signal("inputData",button_pressed)

func _on_logs_toggled(button_pressed):
	emit_signal("logs",button_pressed)
