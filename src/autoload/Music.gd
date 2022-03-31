extends Node2D
onready var sndclick =$click
onready var sndback =$back
onready var pause = $pause
onready var unpause = $unpause

func btnclick():
	sndclick.play()

func btnback():
	sndback.play()

func sndpause():
	pause.play()

func sndunpause():
	unpause.play()
