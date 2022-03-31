extends Area2D



func _on_jangkauan_body_entered(body: Node) -> void:
	if body.is_in_group("player") and body.sedang_terluka == false:
		body.terluka(30)


func _on_pemicu_body_entered(body: Node) -> void:
	
	if body.is_in_group("player"):
		$AnimationPlayer.play("spear_rotation")
	
