extends Node

func _ready():
	pass
	
func _process(delta):
	pass


func resolution(width, height):
	get_viewport().size = Vector2(width,height)

func _on_resolution_item_selected(index):
	match index:
		1:
			print($Resolution.get_item_text(1))
			resolution(1280,720)
		2:
			print($Resolution.get_item_text(2))
			resolution(1920,1080)


func _on_chroma_item_selected(index):
	match index:
		1:
			print("index1")
		2:
			print("index2")
