extends KinematicBody2D

onready var raycast = $RayCast2D
onready var animation = $AnimationTree
onready var sndmeriam = $boom
var timeout  = 1
onready var statemachine = animation["parameters/playback"]
var _bola_meriam = preload("res://src/object/bola_meriam.tscn")

func _process(delta: float) -> void:
	var lihat_target = raycast.is_colliding()
	
	if lihat_target:
		
		statemachine.travel("nembak")
		

func tembak():
	print("tembak")
	sndmeriam.play()
	var bolameriam = _bola_meriam.instance()
	bolameriam.global_position = $Position2D.global_position
	
	get_tree().current_scene.add_child(bolameriam)
	
	
	
