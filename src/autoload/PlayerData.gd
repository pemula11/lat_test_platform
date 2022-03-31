extends Node

var score: = 1
signal health_updated
var current_health: = 0 setget set_health
export var file_name = "user://save_game.save"
var openedlevel = 1
var current_level = 0

func set_health(value: int):
	current_health = value
	emit_signal("health_updated")
	print(PlayerData.current_health)

func save_game():
	var save_file=File.new()
	save_file.open(file_name,File.WRITE)
	var data = {
		"score" : score,
		"openedlevel" : openedlevel
	}
	save_file.store_var(data)
	save_file.close()
	
func load_game():
	var save_file=File.new()
	if !save_file.file_exists(file_name):
		return
	save_file.open(file_name,File.READ)
	if (!save_file.eof_reached()):
		var data = save_file.get_var()
		score = data["score"]
		openedlevel = data["openedlevel"]
	save_file.close()
	
