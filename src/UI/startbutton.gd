extends Button

export(String, FILE) var next_scene_path: = ""


func _on_TombolStart_button_up() -> void:
	
	get_tree().change_scene(next_scene_path)
	print("mulai")
