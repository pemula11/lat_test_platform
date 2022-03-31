extends Area2D

var kecepatan = 250
var arah = Vector2.LEFT


func _process(delta: float) -> void:
	translate(arah*kecepatan*delta)
	

func _ready() -> void:
	$Timer.start()
	

func _on_bola_meriam_body_entered(body: Node) -> void:
	if body.name == "Hero" and body.sedang_terluka == false:
		
		body.terluka(20)
	kecepatan = 0
	$sprite.visible = false
	$CPUParticles2D.emitting = true
	set_collision_mask_bit(1, false)
	$CollisionShape2D.visible = false
	yield(get_tree().create_timer($CPUParticles2D.lifetime), "timeout")
	queue_free()
	
	


func _on_Timer_timeout() -> void:
		queue_free()
