tool
extends Area2D

onready var anim_player: = $AnimationPlayer
export var next_scene: PackedScene



func _on_Portal_pintu_body_entered(body: Node) -> void:
	teleport()


func _get_configuration_warning() -> String:
	return "the Next Scene property cant be empty" if not next_scene else ""

func teleport():
	anim_player.play("FADE_IN")
	get_tree().paused = true
	yield(anim_player, "animation_finished")
	get_tree().paused = false
	if PlayerData.openedlevel <= PlayerData.current_level:
		PlayerData.openedlevel +=1
		PlayerData.save_game()
	
	get_tree().change_scene_to(next_scene)

