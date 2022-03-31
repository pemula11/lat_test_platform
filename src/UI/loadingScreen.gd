extends Control

onready var progres = $bg/bar/progres
export var next_scene: String = ChangerScreen.scene_path


func _on_Timer_timeout() -> void:
	if next_scene != null:
		progres.value += 5
		
		if progres.value >= 100:
			get_tree().change_scene(next_scene)
	else:
		print("Resource Empty!")
