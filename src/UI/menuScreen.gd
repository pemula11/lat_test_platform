extends Control

onready var menu_lvl = $HUD
onready var bgmusic = $bgmusic


func _ready() -> void:
	bgmusic.play()

func _on_TombolStart_pressed() -> void:
	menu_lvl.visible = true
	Music.btnclick()

func _on_Button_button_up() -> void:
	menu_lvl.visible = false
	Music.btnback()
