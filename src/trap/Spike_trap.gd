extends Area2D

func _ready() -> void:
	$AnimationPlayer.play("spike_trigger")
	

func _on_Spike_trap_body_entered(body: Node) -> void:
	if body.is_in_group("player") and body.sedang_terluka == false:
		body.terluka(30)
