extends Control

export var file_name = "user://savean.txt"


func _on_btnsave_pressed() -> void:
	var file  = File.new()
	file.open(file_name,File.WRITE)
	
	
	
	var data = {
		"nama" : "anri",
		"hp" : 222
	}
	file.store_var(data)
	file.close()
	pass


func _on_btnload_pressed() -> void:
	var file  = File.new()
	
	file.open(file_name, File.READ)
	if (!file.eof_reached()):
		var result = file.get_var()
		$Panel/TextEdit.text = result["nama"]
	file.close()
	pass
