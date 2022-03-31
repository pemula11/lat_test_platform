extends Button


export(String, FILE) var next_scene_path: = ""

func _on_TombolMenu_button_up() -> void:
	if next_scene_path == "":
		return
	get_tree().paused =false
	get_tree().change_scene(next_scene_path)
