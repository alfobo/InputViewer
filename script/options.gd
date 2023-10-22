extends Node

signal chromaChange(chroma)
signal rawInput(state)

func resolution(width, height):
	get_viewport().size = Vector2(width,height)

func _on_resolution_item_selected(index):
	match index:
		1:
			resolution(1280,720)
		2:
			resolution(1920,1080)

func _on_chroma_item_selected(index):
	match index:
		1:
			emit_signal("chromaChange",null)
			print("index1")
		2:
			emit_signal("chromaChange","blue")
			print("index2")
		3:
			emit_signal("chromaChange","green")
			print("index3")

func _on_button_toggled(button_pressed):
	emit_signal("rawInput",button_pressed)
