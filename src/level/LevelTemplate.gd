extends Node2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
export var current_level = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	PlayerData.current_level = current_level


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
