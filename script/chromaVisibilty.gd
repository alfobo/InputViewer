extends Node

func changeColor(chroma):
	$chromaColors.color = Color(chroma)
func _on_options_chroma_change(chroma):
	match chroma:
		null:
			changeColor("#4d4d4d")
		"blue":
			changeColor("#2200ff")
		"green":
			changeColor("#00ff04")
