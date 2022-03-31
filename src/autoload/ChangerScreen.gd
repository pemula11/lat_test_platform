extends Node2D
export (PackedScene) var base_load
export var scene_path : String

func goto_scene(path_scene):
	scene_path = path_scene
	get_tree().change_scene("res://src/UI/loadingScreen.tscn")
