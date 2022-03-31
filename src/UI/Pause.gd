extends Control
onready var scene_tree: = get_tree()
onready var pause_overlay: ColorRect = get_node("Menu")
var paused: = false setget set_pause


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		Music.sndunpause()
		self.paused = !paused
		
		scene_tree.set_input_as_handled()

func set_pause(value: bool):
	paused = value
	scene_tree.paused = value
	pause_overlay.visible = value

	
	
