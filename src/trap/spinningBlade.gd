extends Node2D
export (int) var follow_speed = 50

func _ready() -> void:
	$AnimationPlayer.play("spin")
	
func _process(delta: float) -> void:
	$Path2D/PathFollow2D.offset += follow_speed * delta
	


func _on_Area2D_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		body.terluka(40)
