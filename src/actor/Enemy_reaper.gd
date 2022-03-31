extends Actor
onready var sprite = $Sprite
#onready var sprite1 = $Sprite/Animation
var hited = false
#onready var pivot = $pivot
var movement = Vector2.ZERO
onready var raycast = $pivot/RayCast2D
var arah_jalan = false
var serang = false
var can_move = true
var to_player = 1
onready var attdetector = $attackDetektor

func _physics_process(delta: float) -> void:
	if ($Sprite/AnimationPlayer.current_animation == 'serang') or hited:
		return
	move()
	
	change_animation()
	movement = move_and_slide(movement,Vector2.UP)
	
func move()-> Vector2:
	movement.y += gravity 
	
	if can_move:
		movement.x = (-speed.x if arah_jalan else speed.x) * to_player
	if !raycast.is_colliding() or is_on_wall():
		
		can_move = false
		movement.x = 0
		$Waittime.start()
		arah_jalan = !arah_jalan
		scale.x = -scale.x
	
	return movement
	
	


func _on_hitbox_body_entered(body: Node) -> void:
	if body.name == bodyhero and body.sedang_terluka == false:
		body.terluka(15)
	


func change_animation():
	if is_on_floor() and hited == false:
		if movement.x!= 0:
			sprite.play("walk")
		else:
			sprite.play("idle")
		


func hit():
	$attackArea.monitoring = true
	$attackDetektor/CollisionShape2D.disabled = true

func end_hit():
	$attackArea.monitoring = false
	serang = false
	$attackDetektor/CollisionShape2D.disabled = false
	




func _on_attackDetektor_body_entered(body: Node) -> void:
	
	serang = true
	$Sprite/AnimationPlayer.play("serang")




func _on_attackArea_body_entered(body: Node) -> void:
	if body.name == bodyhero and body.sedang_terluka == false:
		body.terluka(20)


func _on_hitbox_area_entered(area: Area2D) -> void:
	if area.is_in_group("sword"):
		hited = true
		
		$Sprite/AnimationPlayer.play("mati")


func _on_Timer_timeout() -> void:
	can_move = true
	


func _on_areatrigger_body_entered(body: Node) -> void:
	if body.name == bodyhero:
		 to_player = 2
	

func _on_areatrigger_body_exited(body: Node) -> void:
	print("kel")
	if body.name == bodyhero:
		 to_player = 1
	#yield(get_tree().create_timer(0.5), "timeout")


