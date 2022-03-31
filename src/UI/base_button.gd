extends Button

var level_path : String




func _on_baseButton_pressed() -> void:
	ChangerScreen.goto_scene(level_path)
	#get_tree().change_scene(level_path)
	Music.btnclick()
